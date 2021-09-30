import 'package:cherryshop/router/controller/controller.dart';
import 'package:cherryshop/controller/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes extends StatefulWidget {
  Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final ctl = Get.put(RoutesCtl());
  final gloalCtl = Get.put(GlobalCtl());
  late PageView _page = PageView(
    children: ctl.list,
    controller: ctl.pageController,
    physics: NeverScrollableScrollPhysics(),
    onPageChanged: (int i) {
      ctl.select.value = i;
    },
  );

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: ctl.bottomList,
            selectedItemColor: Colors.red,
            currentIndex: ctl.select.value,
            onTap: (int i) {
              ctl.selectChange(i);
              ctl.pageController.jumpToPage(i);
            },
          )),
      body: _page,
    );
  }
}
