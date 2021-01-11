/*
 * @Description: 订单详情商品卡片
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:44:36
 * @LastEditTime: 2021-01-10 21:31:22
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_detail_product_model.dart';
import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/model/order/order_type.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailProductCard extends GetView<OrderDetailController> {
  final OrderDetailProductModel product;
  const OrderDetailProductCard(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: XDimens.gap32, vertical: XDimens.gap24),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: XDimens.gap32),
                      child: SizedBox(
                        height: 180.h,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.network(product.image),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 180.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                      fontSize: XDimens.sp30,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  product.orderStatusName,
                                  style: TextStyle(
                                      fontSize: XDimens.sp30,
                                      color: XColors.pinkColor),
                                )
                              ],
                            ),
                            Text(
                              "¥${product.price}",
                              style: TextStyle(fontSize: XDimens.sp28),
                            ),
                            Text(product.description,
                                style: TextStyle(
                                    color: XColors.tipColor,
                                    fontSize: XDimens.sp24)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: XDimens.gap32, bottom: XDimens.gap8),
            child: Text(
              "小计:¥${product.totalPrice}",
              style: TextStyle(
                  fontSize: XDimens.sp24, fontWeight: FontWeight.w500),
            ),
          ),

          ///操作按钮
          Container(
            width: Get.width,
            alignment: Alignment.centerRight,
            child: _OrderDetailProductActionBar(
              product: product,
            ),
          )
        ],
      ),
    );
  }
}

class _OrderDetailProductActionBar extends GetView<OrderDetailController> {
  final OrderDetailProductModel product;
  const _OrderDetailProductActionBar({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ///进入生产环节的商品不可取消
        Visibility(
            child: Row(
              children: [
                Visibility(
                    child: OutlineButton(onPressed: () {}, child: Text("取消")),
                    visible: product.canCancel),

                ///已取消
                Visibility(
                    child: OutlineButton(onPressed: null, child: Text("已取消")),
                    visible: product.orderStatus == OrderStatus.canceled),
              ],
            ),
            visible: product.orderStatus < OrderStatus.producing),
        SizedBox(
          width: XDimens.gap24,
        ),

        ///进入生产环节的商品不可取消
        Visibility(
            child: Row(
              children: [
                ///未选品
                Visibility(
                    child: OutlineButton(
                        onPressed: () => controller.goToSelect(product),
                        child: Text("去选品")),
                    visible: !product.hasSelected),

                ///已选品
                Visibility(
                    child: OutlineButton(
                        onPressed: () => controller.goToSelect(product),
                        child: Text("更换选品")),
                    visible: product.hasSelected),
              ],
            ),
            visible: product.orderType == OrderType.measureOrder),
      ],
    );
  }
}
