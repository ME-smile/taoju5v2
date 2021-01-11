/*
 * @Description: 订单详情底部
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:23:12
 * @LastEditTime: 2021-01-10 21:02:50
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailFooter extends GetView<OrderDetailController> {
  const OrderDetailFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(XDimens.gap32),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: XDimens.gap24),
                color: XColors.foregroundColor,
                height: 32.h,
                width: 4.w,
              ),
              Text(
                "订单信息",
                style: TextStyle(
                    fontSize: XDimens.sp30, fontWeight: FontWeight.w400),
              )
            ],
          ),
          DefaultTextStyle(
              style:
                  TextStyle(fontSize: XDimens.sp26, color: XColors.textColor),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: XDimens.gap8),
                    padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("订单备注:")],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("订单编号:"), Text("${controller.order.no}")],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("创建时间:"),
                        Text("${controller.order.createTime}")
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("创建时间:"),
                        Text("${controller.order.createTime}")
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
