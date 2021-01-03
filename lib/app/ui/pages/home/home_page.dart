/*
 * @Description: 首页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:19:50
 * @LastEditTime: 2020-12-28 16:52:37
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => Get.toNamed(AppRoutes.productList),
            child: Text("去商品列表页"),
          ),
          TextButton(
              onPressed: () => Get.toNamed(AppRoutes.customerList),
              child: Text("去客户列表页")),
          TextButton(
              onPressed: () => Get.toNamed(AppRoutes.orderList),
              child: Text("去订单列表页")),
          TextButton(
              onPressed: () => Get.toNamed(AppRoutes.commitOrder),
              child: Text("提交订单页面")),
          TextButton(
              onPressed: () => Get.toNamed(AppRoutes.setting),
              child: Text("设置页面")),
          TextButton(
              onPressed: () => Get.toNamed(AppRoutes.login), child: Text("登录")),
        ],
      ),
    );
  }
}
