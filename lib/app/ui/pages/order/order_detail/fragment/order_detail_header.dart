/*
 * @Description: 订单详情
 * @Author: iamsmiling
 * @Date: 2021-01-06 13:12:32
 * @LastEditTime: 2021-01-06 14:05:03
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderDetailHeader extends GetView<OrderDetailController> {
  const OrderDetailHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: XColors.foregroundColor,
      width: Get.width,
      padding: EdgeInsets.symmetric(
          horizontal: XDimens.gap32, vertical: XDimens.gap44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.order.title,
            style: TextStyle(
                color: XColors.primaryColor,
                fontSize: XDimens.sp36,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(controller.order.description,
                style: TextStyle(
                    color: XColors.hintColor,
                    fontSize: XDimens.sp28,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
