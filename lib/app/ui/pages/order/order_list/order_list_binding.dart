/*
 * @Description:订单列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:23:58
 * @LastEditTime: 2020-12-22 14:11:47
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/order/order_list/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderListController());
  }
}
