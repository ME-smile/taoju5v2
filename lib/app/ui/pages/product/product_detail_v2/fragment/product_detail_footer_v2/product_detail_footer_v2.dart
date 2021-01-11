/*
 * @Description: 底部价格
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:08:11
 * @LastEditTime: 2021-01-10 21:07:33
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/widgets/product_action_bar.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/product_detail_controller_v2.dart';
import 'package:taojuwu/app/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';

class ProductDetailFooterV2 extends StatelessWidget {
  const ProductDetailFooterV2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: XDimens.gap20),
      child: GetBuilder<ProductDetailControllerV2>(
          tag: Get.parameters["id"],
          builder: (_) {
            return Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    if (Get.isRegistered<SelectableProductListController>())
                      ElevatedButton(
                        child: Text("确认选品"),
                        onPressed: () {
                          Get.find<OrderDetailController>().select();
                        },
                      )
                    else
                      ProductActionBar(
                        onAddToCart: () => Get.toNamed(AppRoutes.cart),
                        onBuy: () => Get.toNamed(AppRoutes.commitOrder,
                            arguments:
                                Get.find<ProductDetailController>().adapt()),
                      ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
