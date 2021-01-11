/*
 * @Description: 订单安装象限信息提示
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:24:06
 * @LastEditTime: 2021-01-10 20:44:06
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderActionTipBar extends GetView<OrderDetailController> {
  const OrderActionTipBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: XDimens.gap32),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("意向测量时间"),
                Text(
                  controller.order.measureTime,
                  style: TextStyle(color: XColors.subTitleColor),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("意向安装时间"),
                Text(
                  controller.order.measureTime,
                  style: TextStyle(color: XColors.subTitleColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
