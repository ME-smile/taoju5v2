/*
 * @Description: 物流
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:06:56
 * @LastEditTime: 2021-01-10 20:34:33
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderLogisticsCard extends GetView<OrderDetailController> {
  const OrderLogisticsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: XDimens.gap36, horizontal: XDimens.gap32),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: XDimens.gap24),
            child: Icon(
              XIcons.add,
              color: XColors.foregroundColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "收货人:${controller.order.receiverName}  ${controller.order.receiverTel}",
                style: TextStyle(
                    color: XColors.textColor,
                    fontSize: XDimens.sp28,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.only(top: XDimens.gap4),
                child: Text("${controller.order.receiverAddress}",
                    style: TextStyle(
                        fontSize: XDimens.sp24, color: XColors.subTitleColor)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
