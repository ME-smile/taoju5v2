/*
 * @Description: 客户详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:29:00
 * @LastEditTime: 2021-01-08 09:22:15
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/fragment/customer_detail_header.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/fragment/customer_detail_kongo.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';

import 'fragment/customer_detail_body.dart';

class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomerDetailHeader(),
                    CustomerDetailKongo(),
                    CustomerDetailBody(),
                  ],
                ),
              );
            },
            loadState: _.loadState,
          );
        },
      ),
    );
  }
}
