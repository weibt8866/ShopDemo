import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert' as json;

abstract class Lang {
  static String en = "en";
  static String zh = "zh";
}

class I18n {
  static FutureOr<Map<String, String>> getLang(String lang) async {
    print("lang --> $lang");
    String _ = await rootBundle.loadString("lang/$lang/$lang.json");
    print(json.jsonDecode(_));
    Map<String, String> res = Map<String, String>.from(json.jsonDecode(_));
    return res;
  }
}

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'hello': '你好',
        },
        'en_US': {
          'hello': 'Hallo Welt',
        }
      };
}
