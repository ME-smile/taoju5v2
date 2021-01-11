/*
 * @Description: 提交订单页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:46:52
 * @LastEditTime: 2021-01-11 17:09:23
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/fragment/commit_order_body.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_customer_choose_button.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_future_button.dart';

import 'fragment/commit_order_footer.dart';
import 'fragment/commit_order_header.dart';
import 'fragment/commit_order_tip.dart';

class CommitOrderPage extends GetView<CommitOrderController> {
  const CommitOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提交订单"),
        actions: [
          Visibility(
            child: XCustomerChooseButton(),
            visible: Get.routing.previous == AppRoutes.home,
          )
        ],
      ),
      body: GetBuilder<CommitOrderController>(
        builder: (_) {
          return Column(
            children: [
              CommitOrderHeader(),
              CommitOrderBody(),
              CommitOrderFooter(),
              CommitOrderTip()
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 44.0,
        alignment: Alignment.centerRight,
        child: XFutureButton(
          onFuture: () => Future.delayed(Duration(seconds: 3)),
          child: Text("提交订单"),
        ),
      ),
    );
  }
}
