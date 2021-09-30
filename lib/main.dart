import 'dart:io';
import 'dart:ui' as ui;
import 'package:bot_toast/bot_toast.dart';
import 'package:cherryshop/config/routes.config.dart';
import 'package:cherryshop/controller/global.dart';
import 'package:cherryshop/i18n/i18n.dart';
import 'package:cherryshop/router/router.dart';
import 'package:cherryshop/sql/sql.dart';
import 'package:cherryshop/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if (kDebugMode) {
    PluginManager.instance!
      ..register(WidgetInfoInspector())
      ..register(WidgetDetailInspector())
      ..register(ColorSucker())
      ..register(AlignRuler())
      ..register(Performance())
      ..register(ShowCode())
      ..register(MemoryInfoPage())
      ..register(CpuInfoPage())
      ..register(DeviceInfoPanel())
      ..register(Console());
    runApp(injectUMEWidget(child: MyApp(), enable: true));
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static GlobalKey<NavigatorState> nav = GlobalKey();
  // final List<String> _notLoginPage = [RoutesName.index];
  @override
  Widget build(BuildContext context) {
    // sql.create(DbName.user_table);
    I18n.getLang(Lang.en);
    return ScreenUtilInit(
      designSize: Size(750, 1070),
      builder: () => GetMaterialApp(
        translations: Message(),
        locale: const Locale('zh', 'CN'),
        enableLog: false,
        fallbackLocale: const Locale('en', 'US'),
        builder: BotToastInit(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],
        routingCallback: (Routing? routing) {
          // if(_notLoginPage.contains(element))
          print(routing!.route);
          // if(routing!.current.contains("/userDetail")) {
          // }
          Future.delayed(Duration(seconds: 0), () {
            final _global = Get.find<GlobalCtl>();
            print(_global.token.value);
            if (_global.token.value == "") {
              // Get.toNamed(RoutesName.login);
            }
          });
        },
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ],
        // 语言切换
        localeResolutionCallback:
            (Locale? local, Iterable<Locale>? supportedLocales) {
          return local ?? Locale('zh', 'CN');
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 40.sp),
              shadowColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              // brightness: Brightness.light,
              color: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black,
                // size: 30
              )),
          splashFactory: NoSplashFactory(),
          primarySwatch: Colors.blue,
        ),
        home: Routes(),
        navigatorKey: nav,
        initialRoute: "/",
        getPages: RoutesSetting.routes,
      ),
    );
  }
}
