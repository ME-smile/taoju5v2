/*
 * @Description: 提交订单页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:46:52
 * @LastEditTime: 2020-12-30 17:54:44
 */

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';

class CommitOrderPage extends GetView<CommitOrderController> {
  const CommitOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提交订单"),
      ),
      body: Text(controller.productList.length.toString()),
    );
  }
}
