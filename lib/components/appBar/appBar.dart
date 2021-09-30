import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAppBar extends AppBar {
  final AppBar? appBar;
  FAppBar({Key? key, this.appBar}) : super(key: key);
  @override
  Widget? get title => this.appBar?.title ?? super.title;
  @override
  PreferredSizeWidget? get bottom => this.appBar?.bottom ?? super.bottom;
  @override
  List<Widget>? get actions => this.appBar?.actions ?? super.actions;
  @override
  Color? get backgroundColor =>
      this.appBar?.backgroundColor ?? super.backgroundColor;
  @override
  Widget? get leading => GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          child: Icon(Icons.chevron_left_outlined),
        ),
      );
}
