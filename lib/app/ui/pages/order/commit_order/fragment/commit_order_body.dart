/*
 * @Description: 提交订单主体内容
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:14:53
 * @LastEditTime: 2021-01-07 22:16:08
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';

class CommitOrderBody extends GetView<CommitOrderController> {
  const CommitOrderBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("提交订单主体"),
    );
  }
}
