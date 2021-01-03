/*
 * @Description: 商品过滤页面
 * @Author: iamsmiling
 * @Date: 2020-12-25 16:28:08
 * @LastEditTime: 2020-12-25 16:37:18
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_controller.dart';

class ProductListFilterPage extends StatelessWidget {
  const ProductListFilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListFilterController>(
        init: ProductListFilterController(),
        builder: (_) {
          return Container(
            width: Get.width * .72,
            height: Get.height,
            color: Theme.of(context).primaryColor,
            child: Text(_.toString()),
          );
        });
  }
}
