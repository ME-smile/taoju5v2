/*
 * @Description: 窗帘属性选择器
 * @Author: iamsmiling
 * @Date: 2021-01-08 15:34:51
 * @LastEditTime: 2021-01-08 16:15:59
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/subpage/product_quotation/product_quotation_controller.dart';

class FabricCurtainProductAttrController extends GetxController {
  List<String> tabList = ["窗纱", "工艺方式", "型材", "遮光布", "幔头", "配饰"];

  ProductDetailModel product;

  @override
  void onInit() {
    product = Get.find<ProductQuotationController>().product;
    super.onInit();
  }
}
