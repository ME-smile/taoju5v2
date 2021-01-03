/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:22:15
 * @LastEditTime: 2020-12-28 22:01:26
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taojuwu/app/delegate/cupertino_localization_delegate.dart';
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
            localizationsDelegates: [CupertinoLocalizationDelegate.delegate]);
      },
    );
  }
}
