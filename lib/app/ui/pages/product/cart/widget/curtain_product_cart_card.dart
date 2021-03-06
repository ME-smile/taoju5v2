/*
 * @Description: 窗帘商品卡片
 * @Author: iamsmiling
 * @Date: 2021-01-15 20:21:16
 * @LastEditTime: 2021-01-15 21:17:50
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/cart_product_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/product/cart/cart_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurtainProductCartCard extends StatelessWidget {
  final CartPorductModel product;
  const CurtainProductCartCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      id: "${product.id}",
      tag: "${product.id}",
      init: CartController(product),
      builder: (_) {
        return Container(
          color: XColors.primaryColor,
          padding: EdgeInsets.all(XDimens.gap16),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                      // key: ObjectKey(e.id),
                      value: product.isChecked.value,
                      onChanged: (bool flag) {
                        product.isChecked.value = flag;
                      }),
                  Container(
                    width: 180.w,
                    margin: EdgeInsets.only(right: XDimens.gap20),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                      ),
                    ),
                  ),
                  Expanded(child: Column())
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
