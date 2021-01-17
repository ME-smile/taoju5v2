/*
 * @Description: 修改价格相关
 * @Author: iamsmiling
 * @Date: 2021-01-13 15:48:35
 * @LastEditTime: 2021-01-15 09:10:39
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_type.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:taojuwu/app/domain/model/order/order_detail_model.dart';

class OrderDetailSheet extends GetView<OrderDetailController> {
  const OrderDetailSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (controller.order.orderType == OrderType.endProductOrder)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("总价:"), Text("¥${controller.order.deposit}")],
          )
        else
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("定金:"), Text("¥${controller.order.deposit}")],
              ),
              GetBuilder<OrderDetailController>(
                id: "modifyPrice",
                builder: (_) {
                  return Visibility(
                      visible: controller.order.isPriceModified,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("原价:"),
                              Text("¥${controller.order.originalPrice}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("修改:"),
                              Spacer(),
                              Text("¥${controller.order.deltaPrice}"),
                              Visibility(
                                child: Text(
                                    "(${controller.order.modifyPriceNote})"),
                                visible: !GetUtils.isNullOrBlank(
                                    controller.order.modifyPriceNote),
                              )
                            ],
                          )
                        ],
                      ));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("合计:"),
                  GetBuilder<OrderDetailController>(
                      id: "modifyPrice",
                      builder: (_) {
                        return Text("¥${controller.order.payAmount}");
                      })
                ],
              ),
              GestureDetector(
                onTap: controller.openModifyPriceModal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("尾款:"),
                    GetBuilder<OrderDetailController>(
                        id: "modifyPrice",
                        builder: (_) {
                          return Text("¥${controller.order.balance}");
                        })
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
