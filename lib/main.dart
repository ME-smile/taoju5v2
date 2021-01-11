/*
 * @Description: app入口
 * @Author: iamsmiling
 * @Date: 2020-12-15 12:05:52
 * @LastEditTime: 2021-01-11 17:12:47
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/sdk_manager/sdk_manager.dart';

import 'app/app.dart';
import 'app/storage/storage_manager.dart';

// import 'config/storage_manager.dart';

void main() async {
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  WidgetsFlutterBinding.ensureInitialized();
  SdkManager().init();
  await StorageManager().init();

  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  return FlutterBugly.postCatchedException(() {
    runApp(App());
  });
}

class XStorageService extends GetxService {}
