/*
 * @Description: SettingController
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:53:57
 * @LastEditTime: 2020-12-29 14:43:11
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/pages/login/login/login_binding.dart';
import 'package:taojuwu/app/ui/pages/login/login/login_page.dart';
import 'package:taojuwu/app/xdio/x_dio.dart';

class SettingController extends GetxController {
  //清空信息
  void clear() {
    ///清空信息
    StorageManager().clear();

    //页面跳转
    Get.offAll(LoginPage(), binding: LoginBinding());
  }

  void logOut() {
    ///清除token
    XDio().refreshToken("");

    ///清空客户信息
    Get.find<CustomerProviderController>().clear();
  }
}
