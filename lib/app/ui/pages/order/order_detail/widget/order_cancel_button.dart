/*
 * @Description: 订单取消
 * @Author: iamsmiling
 * @Date: 2021-01-06 17:43:35
 * @LastEditTime: 2021-01-10 17:49:21
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderCancelButton extends GetView<OrderDetailController> {
  const OrderCancelButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: OutlineButton(onPressed: () {}, child: Text("取消订单")),

      ///商品是窗帘商品 并且处于待审核状态
      // visible: controller.order.productTypeCode,
    );
  }
}
