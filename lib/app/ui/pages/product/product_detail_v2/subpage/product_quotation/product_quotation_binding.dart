/*
 * @Description: 商品报价单
 * @Author: iamsmiling
 * @Date: 2021-01-08 15:03:03
 * @LastEditTime: 2021-01-08 15:04:24
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/subpage/product_quotation/product_quotation_controller.dart';

class ProductQuotationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductQuotationController());
  }
}
