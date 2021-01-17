/*
 * @Description: 提交订单成功的页面
 * @Author: iamsmiling
 * @Date: 2021-01-08 10:28:55
 * @LastEditTime: 2021-01-16 20:13:49
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';

class CommitOrderSuccessPage extends GetView<CustomerProviderController> {
  const CommitOrderSuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(AppRoutes.home);
        controller.clear();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("提交成功"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlineButton(
                onPressed: () => Get.offAllNamed(AppRoutes.productList),
                child: Text("继续挑选"),
              ),
              ElevatedButton(
                onPressed: () => Get.offAndToNamed(
                    AppRoutes.orderList + "/${Get.parameters["customerId"]}"),
                child: Text("查看订单"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
