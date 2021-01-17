/*
 * @Description: SettingController
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:53:57
 * @LastEditTime: 2021-01-12 10:34:39
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_manager.dart';
import 'package:taojuwu/app/domain/model/user/user_info_model.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';
import 'package:taojuwu/app/ui/dialog/clear_cache.dart';
import 'package:taojuwu/app/ui/dialog/logout.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/pages/home/user_provider_controller.dart';
import 'package:taojuwu/app/ui/pages/login/login/login_binding.dart';
import 'package:taojuwu/app/ui/pages/login/login/login_page.dart';
import 'package:taojuwu/app/xdio/x_dio.dart';

class SettingController extends GetxController {
  String cacheSize = "";
  String versionCode = "";
  //清空信息
  void clear() {
    ///清空信息
    StorageManager().clear();
  }

  UserProviderController get userProviderController =>
      Get.find<UserProviderController>();

  void logOut() {
    showLogoutDialog(Get.context).then((value) {
      if (value) {
        ///清除token
        XDio().refreshToken("");

        ///清空客户信息
        Get.find<CustomerProviderController>().clear();
        //页面跳转
        Get.offAll(LoginPage(), binding: LoginBinding());
      }
    }).whenComplete(update);
  }

  UserInfoModel get user => userProviderController.user;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {
    await Future.wait([_getCacheSize(), _getVersionCode()]);
    update();
  }

  Future _getCacheSize() async {
    cacheSize = await AppManager.loadCache();
  }

  Future _getVersionCode() async {
    versionCode = await AppManager.getAppVersion();
  }

  Future clearCache() {
    return showClearCacheDialog(Get.context).then((value) {
      if (value == true) {
        AppManager.clearCache().whenComplete(() {
          cacheSize = "";
          update();
        });
      }
    });
  }
}
