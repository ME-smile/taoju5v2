/*
 * @Description: 窗纱商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-23 09:16:52
 * @LastEditTime: 2020-12-25 14:20:08
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/gauze_curtain_product_attrs_selector/gauze_curtain_peoduct_attrs_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_pridce_delegator.dart';

class GauzeCurtainProductAttrsSelectorCard extends StatelessWidget {
  const GauzeCurtainProductAttrsSelectorCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GauzeCurtainProductAttrsSelectorController>(
        initState: (_) {
      ProductDetailController productDetailController =
          Get.find<ProductDetailController>();
      productDetailController.selectorController =
          Get.find<GauzeCurtainProductAttrsSelectorController>();
      productDetailController.priceDelegator =
          GauzeCurtainProductPriceDelegator();
    }, builder: (_) {
      return Column(
        children: [
          for (CurtainProductAttrModel e in _.attrList)
            Row(
              children: [Text(e.typeName), Text(e.currentOptionName)],
            )
        ],
      );
    });
  }
}
