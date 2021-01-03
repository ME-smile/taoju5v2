/*
 * @Description: app入口
 * @Author: iamsmiling
 * @Date: 2020-12-15 12:05:52
 * @LastEditTime: 2020-12-28 21:10:25
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'app/storage/storage_manager.dart';

// import 'config/storage_manager.dart';

void main() async {
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager().init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  return runApp(App());
}

class XStorageService extends GetxService {}
