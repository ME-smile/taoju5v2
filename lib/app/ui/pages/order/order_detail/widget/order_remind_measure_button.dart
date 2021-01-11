/*
 * @Description: 提醒测量
 * @Author: iamsmiling
 * @Date: 2021-01-06 17:43:35
 * @LastEditTime: 2021-01-10 17:49:38
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:taojuwu/app/domain/model/order/order_detail_model.dart';

class OrderRemindMeasureButton extends GetView<OrderDetailController> {
  const OrderRemindMeasureButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: OutlineButton(onPressed: () {}, child: Text("提醒测量")),

      ///商品是窗帘商品 并且处于待审核状态
      visible: controller.order.productType is CurtainProductType &&
          controller.order.orderStatus == OrderStatus.toBeMeasured,
    );
  }
}
