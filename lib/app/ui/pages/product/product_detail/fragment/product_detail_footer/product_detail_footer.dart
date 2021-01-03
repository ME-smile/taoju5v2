/*
 * @Description: 底部价格
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:08:11
 * @LastEditTime: 2020-12-30 17:52:30
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';

class ProductDetailFooter extends StatelessWidget {
  const ProductDetailFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(
            horizontal: XDimens.gap20, vertical: XDimens.gap12),
        child: Row(
          children: [
            GetBuilder<ProductDetailController>(
                id: "totalPrice",
                builder: (_) {
                  return Text.rich(TextSpan(text: "预计\n", children: [
                    TextSpan(
                        text:
                            "${_.priceDelegator.totalPrice.toStringAsFixed(2)}")
                  ]));
                }),
            Spacer(),
            Expanded(
                child: Visibility(
                    child: Row(
              children: [
                Expanded(
                    child: OutlinedButtonTheme(
                  data: OutlinedButtonThemeData(),
                  child: OutlinedButton(
                    onPressed: () => Get.toNamed(AppRoutes.cart),
                    child: Text("加入购物车"),
                  ),
                )),
                Expanded(
                    child: ElevatedButtonTheme(
                  data: ElevatedButtonThemeData(),
                  child: ElevatedButton(
                      onPressed: () => Get.toNamed(AppRoutes.commitOrder,
                          arguments:
                              Get.find<ProductDetailController>().adapt()),
                      child: Text("立即购买")),
                ))
              ],
            )))
          ],
        ),
      );
    });
  }
}
