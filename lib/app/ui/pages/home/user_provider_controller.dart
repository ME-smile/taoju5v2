/*
 * @Description: 用户信息
 * @Author: iamsmiling
 * @Date: 2020-12-30 16:52:38
 * @LastEditTime: 2020-12-30 17:00:28
 */

import 'dart:convert';

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/user/user_info_model.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';

class UserProviderController extends GetxController {
  UserInfoModel user;

  @override
  void onInit() {
    StorageManager storageManager = StorageManager();
    Map json = jsonDecode(storageManager.sharedPreferences.get("userInfo"));
    user = UserInfoModel.fromJson(json);
    super.onInit();
  }
}
