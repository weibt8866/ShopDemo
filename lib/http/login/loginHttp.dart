import 'package:cherryshop/http/http.dart';
import 'package:cherryshop/http/login/models/login_model.dart';
class Login {
  static Future<LoginModel> getCode(int code) async {
    HttpBaseType _res = await http.get<LoginModel>("/codeworld-auth/getCaptchaBase64", params: {"yzmId": code});
    return LoginModel.fromJson(_res.data);
  }
}
