import 'package:cherryshop/components/appBar/appBar.dart';
import 'package:cherryshop/utils/toast/toast.dart';
import 'package:cherryshop/view/find/controller/controller.dart';
import 'package:cherryshop/view/userDetail/controller/userDetailController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetail extends StatefulWidget {
  UserDetail({Key? key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final ctl = Get.put(UserDetailCtl());

  @override
  void initState() {
    print(Get.parameters['id']);
    Toast.success(text: "成功");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCtl = Get.find<FindCtl>();

    return Scaffold(
      appBar: FAppBar(
          appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              homeCtl.incement(4);
              print(homeCtl.value);
            },
            child: Text("UserDetail")),
      )),
      body: Text("text"),
    );
  }
}
