import 'package:cherryshop/view/find/find.dart';
import 'package:cherryshop/view/home/home.dart';
import 'package:cherryshop/view/setting/setting.dart';
import 'package:cherryshop/view/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutesCtl extends GetxController {
  List<Widget> _widget = [Home(), User(), Find(), Setting()];
  var list = <Widget>[].obs;
  var select = 0.obs;
  void selectChange(int i) => {select.value = i};

  var pageController = PageController(keepPage: true);

  var bottomList = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "User",
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Find",
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Setting",
        activeIcon: Icon(
          Icons.home,
          color: Colors.red,
        )),
  ].obs;
  @override
  void onInit() {
    list.value = [..._widget];
    print("initState");
    super.onInit();
  }
}
