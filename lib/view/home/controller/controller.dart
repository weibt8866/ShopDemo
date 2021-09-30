import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:cherryshop/http/http.dart';
import 'package:cherryshop/http/login/loginHttp.dart';
import 'package:cherryshop/http/login/models/login_model.dart';
import 'package:cherryshop/view/home/controller/tets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCtl extends GetxController {
  GlobalKey key = GlobalKey();
  var count = 0.obs;
  var image = [].obs;
  var list = [].obs;
  var code = Uint8List.fromList([]).obs;
  var globalKey = GlobalKey().obs;
  var map = {"name": "zlj"}.obs;
  void incrment() {
    count++;
  }

  void setImage(Uint8List _list) {
    image.add(_list);
  }

  void setName() {
    this.map.value["name"] = "4444";
  }

  test() async {
    var _res = await Login.getCode(DateTime.now().millisecondsSinceEpoch);
    print(" 结果：test -->  ${_res.url} \n ");
    print("类型 -->  ${Base64Decoder().convert(_res.url!.split(",")[1])}");
    scheduleMicrotask(() {});
    code.value = Base64Decoder().convert(_res.url!.split(",")[1]);
   
  }

  @override
  void onInit() async {
    Test1 _test1 = Test1(str: "22", name: "ddd");
    _test1.str = "???";
    _test1.ready();
    test();
    // code.value = _res.data["url"];
     super.onInit();
  }
}
