import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cherryshop/config/routes.config.dart';
import 'package:cherryshop/controller/global.dart';
import 'package:cherryshop/http/home/models/home_model.dart';
import 'package:cherryshop/sql/sql.dart';
import 'package:cherryshop/utils/storage/storage.dart';
import 'package:cherryshop/view/home/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final ctl = Get.put(HomeCtl());
  final globalCtl = Get.find<GlobalCtl>();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      sqlQueeryNum();
    });
    if (mounted) {
      DateTime.now();
      Map<String, dynamic> _map = new Map();
      print(_map.isEmpty);

      // storage.getStorage<bool>(k: "ff");
    }
    print("是否debug模式：$kDebugMode");
    super.initState();
  }

  Future<void> sqlQueeryNum() async {
    print("sql dbpath : ${sql.dbPath}");
    // final int _num = await sql.queryNum();
    // final _container = ctl.globalKey.value.currentContext!.size!.height;
    // print("_container --> $_container");
    final res = await storage.getStorage<bool>(k: "fff");
    print("result --> $res");
  }

  getData() {
    return rootBundle.loadString("key");
  }

  @override
  void didChangeDependencies() {
    // sqlQueeryNum();
    print("改变");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("build  --> ");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            // if()
            print("langu --> ${ui.window.locale}");
            // ignore: unrelated_type_equality_checks
            print("globalCtl.lang --> ${globalCtl.lang}");
            ui.Locale? locale = globalCtl.lang == LangMap.langs['en']
                ? LangMap.langs['cn']
                : LangMap.langs['en'];
            print(locale);
            globalCtl.langChange(locale!);
            print("修改后的国际化配置  -> ${globalCtl.lang}");
          },
          icon: Icon(Icons.ac_unit)),
      body: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 2000));
              return Future.value(true);
            },
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((ctx, i) {
            return FutureBuilder(
                future: ctl.test(),
                builder: (ctx, status) {
                  switch (status.connectionState) {
                    case ConnectionState.waiting:
                      return Container(
                        child: Text("hello".tr),
                      );
                    case ConnectionState.active:
                      return Container(
                        color: Colors.red,
                        height: 300,
                        child: Text("active"),
                      );
                    case ConnectionState.done:
                      // List res = status.data as List;
                      ctl.setName();
                      return GestureDetector(
                        onTap: () {
                          ctl.test();
                        },
                        child: Container(
                            key: ctl.globalKey.value,
                            // ignore: invalid_use_of_protected_member
                            child:  Obx(() => Image.memory(ctl.code.value))
                        ),
                      );
                    default:
                      return Container(
                        child: Text("${ctl.map['name']}"),
                      );
                  }
                });
          }, childCount: 1))
          // Container(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Text("ddd")
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
