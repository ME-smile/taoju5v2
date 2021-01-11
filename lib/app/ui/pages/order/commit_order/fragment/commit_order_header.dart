/*
 * @Description:提交订单头部
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:03:08
 * @LastEditTime: 2021-01-11 15:22:29
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';

class CommitOrderHeader extends GetView<CommitOrderController> {
  const CommitOrderHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GetBuilder<CommitOrderController>(builder: (_) {
            return GestureDetector(
              onTap: () => Get.toNamed(
                  AppRoutes.customerAddressEdit + "/${_.customer?.id}"),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 64.sp,
                      child: Text(
                        "收",
                        style: TextStyle(
                            color: XColors.primaryColor,
                            fontSize: XDimens.sp48),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: XDimens.gap24),
                      child: Text(
                        "请填写收货地址",
                        style: TextStyle(
                            fontSize: XDimens.sp32,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Spacer(),
                    Icon(XIcons.next)
                  ],
                ),
              ),
            );
          }),
          Divider(),
          Container(
            margin: EdgeInsets.only(top: XDimens.gap32),
            child: Row(
              children: [
                Container(
                  child: Text(
                    "售",
                    style: TextStyle(
                        fontSize: XDimens.sp32, fontWeight: FontWeight.w500),
                  ),
                  height: 128.sp,
                  width: 128.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(64.sp)),
                      color: XColors.primaryColor,
                      border:
                          Border.all(color: XColors.foregroundColor, width: 1)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("销售员:${controller.user.nickName}"),
                        Text("${controller.user.userTel}")
                      ],
                    ),
                    Text("门店信息:${controller.user.shopName}")
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
