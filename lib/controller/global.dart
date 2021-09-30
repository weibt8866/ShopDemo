import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangMap {
  static Map<String, Locale> langs = {
    "cn": Locale("zh", "CN"),
    "en": Locale("en", "US"),
  };
}

class GlobalCtl extends GetxController {
  var token = "".obs;

  var lang = LangMap.langs["cn"].obs;

  // 修改token
  void tokenDispatch(String _token) {
    this.token.value = _token;
  }

  // 修改语言
  void langChange(Locale lang) {
    this.lang.value = lang;
    Get.updateLocale(lang);
  }
}
