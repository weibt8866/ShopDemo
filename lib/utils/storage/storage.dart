import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as json;

class Storage {
  late SharedPreferences? sp;

  factory Storage() => _shareInstance();

  static Storage? _instance;

  static Storage _shareInstance() {
    if (_instance == null) {
      _instance = Storage._();
    }
    return _instance!;
  }

  Storage._() {
    print("object ---");
  }

  init() async {
    this.sp = await SharedPreferences.getInstance();
  }

  getStorage<T>({required String k}) async {
    // if(this.sp == null) {
    await this.init();
    // }
    print("type --> $T");
    switch (T) {
      case int:
        return this.sp!.getInt(k) ?? Future<int>.value(0);
      case bool:
        return this.sp!.getBool(k) ?? Future<bool>.value(false);
      case double:
        return this.sp!.getDouble(k) ?? Future<double>.value(0.00);
      case List:
        return this.sp!.getStringList(k) ?? Future<List>.value([]);
      case String:
        return this.sp!.getString(k) ?? Future<String>.value("");
      default:
        return this.sp!.get(k);
    }
  }

  setStorage({required String k, required dynamic v}) async {
    await this.init();
    this.sp!.setString(k, json.jsonEncode(v));
  }
}

final Storage storage = Storage();
