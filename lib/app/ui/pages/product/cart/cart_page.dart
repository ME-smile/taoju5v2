/*
 * @Description: 购物车页面
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:27:58
 * @LastEditTime: 2020-12-31 17:57:59
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/cart/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: GetBuilder<CartController>(
        builder: (_) {
          return Text(_.toString());
        },
      ),
    );
  }
}
