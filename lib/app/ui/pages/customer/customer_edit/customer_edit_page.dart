/*
 * @Description: 编辑客户页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:00
 * @LastEditTime: 2020-12-29 13:28:41
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_edit/customer_edit_controller.dart';

class CustomerEditPage extends StatelessWidget {
  const CustomerEditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("编辑客户"),
          actions: [
            TextButton(
                onPressed: () => Get.toNamed(AppRoutes.customerList),
                child: Text("选择已有客户"))
          ],
        ),
        body: GetBuilder<CustomerEditController>(builder: (_) {
          return SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Text("姓名"),
                  TextFormField(
                    initialValue: _.target.name,
                    onChanged: (String str) {
                      _.target.name = str;
                    },
                  ),
                  Text("手机号"),
                  TextFormField(
                    initialValue: _.target.tel,
                  ),
                  Text("姓名"),
                  TextFormField(
                    initialValue: _.target.name,
                  ),
                  Text("姓名"),
                  TextFormField(
                    initialValue: _.target.name,
                  ),
                  Text("姓名"),
                  TextFormField(
                    initialValue: _.target.name,
                  ),
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar: RaisedButton(
          onPressed: () =>
              Get.back(result: Get.find<CustomerEditController>().target),
          child: Text("确定"),
        ),
      ),
    );
  }
}
