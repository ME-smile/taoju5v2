/*
 * @Description: 用户信息
 * @Author: iamsmiling
 * @Date: 2020-12-30 16:52:38
 * @LastEditTime: 2021-01-12 09:56:47
 */

import 'dart:convert';

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/user/user_info_model.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';

class UserProviderController extends GetxController {
  UserInfoModel user;
  String greetWord;
  String _getGreetWord({DateTime time}) {
    // 6-12 上午好 // 12-18 下午好
    time ??= DateTime.now();
    int h = time.hour + 1;
    if (6 < h && h < 13) return '上午好';
    if (13 <= h && h < 19) return '下午好';
    return '晚上好';
  }

  @override
  void onInit() {
    greetWord = _getGreetWord();
    StorageManager storageManager = StorageManager();
    Map json =
        jsonDecode(storageManager.sharedPreferences.get("userInfo") ?? "{}");
    user = UserInfoModel.fromJson(json);
    super.onInit();
  }
}
