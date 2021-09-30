import 'package:cherryshop/view/login/login.dart';
import 'package:cherryshop/view/userDetail/userDetail.dart';
import 'package:get/get.dart';

abstract class RoutesName {
  static String index = "/";
  static String userDetail = "/userDetail";
  static String login = "/login";
}

class RoutesSetting {
  static List<GetPage> routes = [
    GetPage(
        name: "${RoutesName.userDetail}/:id",
        page: () => UserDetail(),
        transition: Transition.native),
    GetPage(
        name: RoutesName.login,
        page: () => Login(),
        transition: Transition.native),
    // GetPage(name: RoutesName.find, page: () => Find(), transition: Transition.native),
  ];
}

class MiddleWare {
  static observer(Routing routing) {
    ///你除了可以监听路由外，还可以监听每个页面上的SnackBars、Dialogs和Bottomsheets。
    if (routing.current == '/second') {
      Get.snackbar("Hi", "You are on second route");
    } else if (routing.current == '/third') {
      print('last route called');
    }
  }
}
