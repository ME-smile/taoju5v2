/*
 * @Description: 提交订单页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:46:52
 * @LastEditTime: 2021-01-16 20:05:52
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/fragment/commit_order_body.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_customer_choose_button.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_future_button.dart';

import 'fragment/commit_order_footer.dart';
import 'fragment/commit_order_header.dart';
import 'fragment/commit_order_tip.dart';

class CommitOrderPage extends GetView<CommitOrderController> {
  const CommitOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("提交订单"),
        elevation: .5,
        actions: [XCustomerChooseButton()],
      ),
      body: GetBuilder<CommitOrderController>(
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CommitOrderHeader(),
                CommitOrderBody(),
                CommitOrderFooter(),
                CommitOrderTip()
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        color: XColors.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: XDimens.gap32),
        alignment: Alignment.centerRight,
        child: XFutureButton(
          onFuture: controller.submitOrder,
          onSuccess: controller.onSubmitSuceess,
          child: Text("提交订单"),
        ),
      ),
    );
  }
}
