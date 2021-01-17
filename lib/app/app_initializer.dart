/*
 * @Description: APP初始化配置
 * @Author: iamsmiling
 * @Date: 2021-01-12 22:34:48
 * @LastEditTime: 2021-01-13 15:39:37
 */
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';
import 'package:taojuwu/app/ui/widgets/base/x_success_tick_widget.dart';

import 'config/sdk_manager/sdk_manager.dart';

abstract class AppInitializer {
  static Future init() async {
    _initEasyloading();
    _initSDK();
    _initWidgetBinding();
    _initSystemUI();
    await _initStorage();
  }

  static void _initEasyloading() {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.instance.successWidget = XTickSuccessView();
    EasyLoading.instance.errorWidget = Container(
      width: 64,
      height: 64,
      color: Colors.transparent,
      child: FlareActor("assets/flrs/fail.flr",
          alignment: Alignment.center,
          color: Colors.white,
          fit: BoxFit.contain,
          animation: "idle"),
    );
    EasyLoading.instance.displayDuration = const Duration(milliseconds: 500);
  }

  static void _initSDK() {
    SdkManager().init();
  }

  static Future _initStorage() async {
    await StorageManager().init();
  }

  static void _initWidgetBinding() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  static void _initSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));
  }
}
