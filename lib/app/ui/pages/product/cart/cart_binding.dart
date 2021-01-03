/*
 * @Description: CartBinding
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:29:52
 * @LastEditTime: 2020-12-28 10:31:35
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
