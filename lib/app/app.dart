/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:22:15
 * @LastEditTime: 2021-01-12 19:45:30
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taojuwu/app/res/x_theme.dart';

import 'package:taojuwu/app/routes/app_pages.dart';
// import 'package:taojuwu/app/ui/widgets/pages/home/home_page.dart';

import 'config/app_config.dart';
import 'ui/pages/home/home_binding.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(constraints,
            designSize: Size(750, 1334), allowFontScaling: false);
        return GetMaterialApp(
          getPages: AppPages.pages,
          theme: XTheme.lightTheme,
          initialRoute: AppPages.initial,
          initialBinding: TaojuwuBinding(),
          builder: EasyLoading.init(),

          // defaultTransition: Transition,
          debugShowCheckedModeBanner: AppConfig.isDebug,
          localizationsDelegates: [
            // CupertinoLocalizationDelegate.delegate,
            GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
            GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
            GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
            GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
          ],
          supportedLocales: [Locale("en"), Locale("zh")],
        );
      },
    );
  }
}
