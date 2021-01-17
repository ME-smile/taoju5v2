/*
 * @Description: 选择客户的按钮
 * @Author: iamsmiling
 * @Date: 2020-12-29 13:12:01
 * @LastEditTime: 2021-01-12 17:42:22
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';

class XCustomerChooseButton extends StatelessWidget {
  const XCustomerChooseButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProviderController>(builder: (_) {
      return TextButton.icon(
          key: ValueKey(_?.name),

          ///传递一个bool参数 表示是否展示 “选择已有客户” 的按钮
          onPressed: () => Get.toNamed(AppRoutes.customerEdit + "/1"),
          icon: Image.asset(
              AppConfig.assetImagePrefixPath + "customer_badge.png"),
          label: Text(_?.name));
    });
  }
}
