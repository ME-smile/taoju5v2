/*
 * @Description: 商品详情页
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:35:39
 * @LastEditTime: 2020-12-22 15:35:39
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_detail_controller.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单详情"),
      ),
      body: GetBuilder<OrderDetailController>(
        builder: (_) {
          return Text(_.toString());
        },
      ),
    );
  }
}
