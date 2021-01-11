/*
 * @Description:商品详情头部
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:12:26
 * @LastEditTime: 2021-01-07 22:26:27
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';

class ProductDetailHeader extends GetView<ProductDetailController> {
  const ProductDetailHeader({Key key}) : super(key: key);

  ProductDetailModel get product => controller.detailModel;

  @override
  Widget build(BuildContext context) {
    // ThemeData themeData = Theme.of(context);
    // TextTheme textTheme = themeData.textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Text(product.name)],
          ),
          Container(
            child: Text('¥${product.price.toStringAsFixed(2)}'),
          )
        ],
      ),
    );
  }
}
