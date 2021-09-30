
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:cherryshop/config/http.config.dart';

class HttpBaseType<T>{
  String? msg;
  int? code;
  T? data;

  HttpBaseType({required this.msg, required this.code, required this.data});

  HttpBaseType.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['code'] = code;
    data['data'] = this.data;
    return data;
  }
}

class Http {
  Dio? _dio;

  factory Http() => _shareInstance();

  static Http? _instance;

  static Http _shareInstance() {
    _instance ??= Http._(base: HttpConfig.baseUrl);
    return _instance!;
  }

  Http._({required String base}) {
    if(HttpConfig.proxyUrl != "") {
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        // config the http client
          client.findProxy = (uri) {
              //proxy all request to localhost:8888
              return "PROXY ${HttpConfig.proxyUrl}"; //这里将localhost设置为自己电脑的IP，其他不变，注意上线的时候一定记得把代理去掉
          };
          // you can also create a HttpClient to dio
          // return HttpClient();
      };
    }

    BaseOptions options = BaseOptions(
        baseUrl: base,
        connectTimeout: 10000,
        contentType: Headers.formUrlEncodedContentType);

    _dio = Dio(options);

    _dio!.interceptors.add(InterceptorsWrapper(
        onRequest: onRequest, onResponse: onResponse, onError: onError
      ),
    );
    _dio!.interceptors.add(LogInterceptor(requestBody: false));
  }

  void onRequest(RequestOptions _opts, RequestInterceptorHandler handler) {
    return handler.next(_opts);
  }

  void onResponse( response, ResponseInterceptorHandler _handler) {
    print(
        '''\n 请求路径 : ${response.requestOptions.uri}\n 数据: ${response.data}
    ''');
    print("${response.data} --->>>>");
    final  __res = response.data;
    return _handler.next(response);
  }

  onError(DioError err, ErrorInterceptorHandler _hand) {
    return _hand.next(err);
  }

  Future get<T>(String url, {Map<String, dynamic>? params})async {
    var _res = await _dio!.get(url, queryParameters: params);
    final HttpBaseType res = HttpBaseType(code: _res.data!['code'], msg: _res.data!['msg'], data: _res.data!['data'] );
    return res; 
  }

  Future post(String url, {Map<String, dynamic>? data}) async {}

  Future put(String url, {Map<String, dynamic>? data}) async {}

  Future delete(String url, {Map<String, dynamic>? params}) async {}
}

final Http http = Http();
