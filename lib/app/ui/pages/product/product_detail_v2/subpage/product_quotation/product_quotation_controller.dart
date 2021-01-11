/*
 * @Description: 商品报价单controller
 * @Author: iamsmiling
 * @Date: 2021-01-08 15:02:08
 * @LastEditTime: 2021-01-08 16:06:11
 */
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/subpage/fabric_curtain_product_attr/fabric_curtain_product_attr_page.dart';

class ProductQuotationController extends GetxController {
  ProductDetailModel product;

  ///选择商品属性
  Future select() {
    return showCupertinoModalPopup(
        context: Get.context,
        builder: (BuildContext context) {
          return FabricCurtainProductAttrPage();
        });
  }

  @override
  void onInit() {
    product = Get.arguments;
    super.onInit();
  }
}
