import 'package:cherryshop/http/http.dart';
class HomeHttp {
  static index() {
    return http.get("/front/zFirst/today/before", params: {});
  }
}
