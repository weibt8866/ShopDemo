import 'package:cherryshop/config/routes.config.dart';
import 'package:cherryshop/controller/global.dart';
import 'package:cherryshop/view/find/controller/controller.dart';
import 'package:cherryshop/view/userDetail/userDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Find extends StatefulWidget {
  Find({Key? key}) : super(key: key);

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var ctl = Get.put(FindCtl());
  final global = Get.find<GlobalCtl>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(global.token.value)),
      ),
      body: Column(
        children: [
          Container(
              // child: ,
              ),
          GestureDetector(
              onTap: () {
                global.tokenDispatch("_token");
                ctl.incement(5);
                Get.to(UserDetail());
              },
              child: Obx(() => Text("${ctl.value}"))),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
