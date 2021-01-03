/*
 * @Description: 客户详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:29:00
 * @LastEditTime: 2020-12-22 12:43:23
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';

class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CustomerDetailController controller =
            Get.find<CustomerDetailController>();
        Get.back(result: controller.customer);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("客户详情"),
          actions: [
            TextButton(
                onPressed: () {
                  CustomerDetailController controller =
                      Get.find<CustomerDetailController>();
                  Get.toNamed(AppRoutes.customerEdit,
                          arguments: controller.customer)
                      .then((value) {
                    if (value is CustomerDetailModel) {
                      controller.customer = value;
                      controller.update();
                    }
                  });
                },
                child: Text("编辑"))
          ],
        ),
        body: GetBuilder<CustomerDetailController>(
          builder: (_) {
            return XLoadStateBuilder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Text("姓名:${_.customer.name}"),
                    Text("年龄:${_.customer.age}"),
                    Text("入店时间:${_.customer.enterTime}"),
                    Text("性别:${_.customer.gender.name}"),
                    Text("区域:${_.customer.concreteAddress}"),
                    Text("详细地址:${_.customer.address.concreteAddress}")
                  ],
                );
              },
              loadState: _.loadState,
            );
          },
        ),
      ),
    );
  }
}
