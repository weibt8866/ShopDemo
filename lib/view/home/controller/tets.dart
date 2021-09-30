import 'dart:isolate';

import 'package:flutter/cupertino.dart';

abstract class Test {
  @mustCallSuper
  String? str;

  @protected
  void init() {
    print("init");
  }
}

class Test1 extends Test {
  String name;

  @override
  set str(String? _str) {
    super.str = _str;
  }

  get str => super.str;

  Test1({Key? key, str, required this.name});

  void ready() {
    this.init();
  }
}

typedef int ListType();

enum TestType1 {
  list,
}

class MyWidget extends InheritedWidget {
  MyWidget({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  @override
  InheritedElement createElement() => Elements(this);
}

class Elements extends InheritedElement {
  Elements(InheritedWidget widget) : super(widget);
  String value = "123";
  dynamic val = {};
  init() {
    switch (val) {
      case TestType1.list:
        break;
      default:
    }
  }
}

void fn(String str) {
  print(str);
}

void function() {
  Isolate.spawn(fn, "message");
}
