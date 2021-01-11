/*
 * @Description: 路由中间件
 * @Author: iamsmiling
 * @Date: 2021-01-04 17:03:50
 * @LastEditTime: 2021-01-05 09:39:12
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';

class AppMiddleWare extends RouteObserver {
  static observer(Routing routing) {
    ///是否已经选择客户
    if (GetUtils.isNull(Get.find<CustomerProviderController>()?.id)) {
      if (routing?.current == AppRoutes.cart) {
        return EasyLoading.showInfo("请选择客户");
      }
    }
  }
}
