/*
 * @Description: 客户详情主体内容
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:07:06
 * @LastEditTime: 2021-01-07 17:17:10
 */

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_controller.dart';

class CustomerDetailBody extends StatelessWidget {
  const CustomerDetailBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerDetailController>(
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: XDimens.gap32),
          color: XColors.primaryColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("来源"), Text("门店游客")],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("手机"), Text("${_.customer.tel}")],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("微信"), Text("${_.customer.wx}")],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
