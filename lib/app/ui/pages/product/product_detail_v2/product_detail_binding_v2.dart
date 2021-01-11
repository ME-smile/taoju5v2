/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:47:53
 * @LastEditTime: 2021-01-09 19:33:32
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/product_detail_controller_v2.dart';

class ProductDetailBindingV2 extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailControllerV2(), tag: Get.parameters["id"]);
  }
}
