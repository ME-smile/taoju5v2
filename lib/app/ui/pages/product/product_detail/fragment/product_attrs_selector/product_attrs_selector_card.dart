/*
 * @Description: 商品属性选择器
 * @Author: iamsmiling
 * @Date: 2020-12-25 13:26:21
 * @LastEditTime: 2021-01-15 15:47:49
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/res/x_dimens.dart';

import 'fabric_curtain_product_attrs_selector/fabric_curtain_product_attrs_selector_card.dart';
import 'gauze_curtain_product_attrs_selector/gauze_curtain_product_attrs_selector_card.dart';
import 'rolling_curtain_product_attrs_selector/rolling_curtain_product_attrs_selector_card.dart';

class ProductAttrsSelectorCard extends StatelessWidget {
  const ProductAttrsSelectorCard({Key key}) : super(key: key);

  BaseProductType get productType => Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: XDimens.gap16),
      child: Column(
        children: [
          Visibility(
            child: FabircCurtainProductAttrsSelectorCard(),
            visible: productType is FabricCurtainProductType,
          ),
          Visibility(
            child: GauzeCurtainProductAttrsSelectorCard(),
            visible: productType is GauzeCurtainProductType,
          ),
          Visibility(
            child: RollingCurtainProductAttrsSelectorCard(),
            visible: productType is RollingCurtainProductType,
          ),
        ],
      ),
    );
  }
}
