/*
 * @Description:提交订单头部
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:03:08
 * @LastEditTime: 2021-01-17 11:17:55
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';

class CommitOrderHeader extends GetView<CommitOrderController> {
  const CommitOrderHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: XColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: XDimens.gap32,
      ),
      child: Column(
        children: [
          GetBuilder<CommitOrderController>(builder: (_) {
            return GestureDetector(
              onTap: () => Get.toNamed(
                  AppRoutes.customerAddressEdit + "/${_.customer?.id}",
                  arguments: controller.customer),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: XDimens.gap24),
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
                      child: GetBuilder<CustomerProviderController>(
                        id: "address",
                        builder: (_) {
                          return Column(
                            children: [
                              if (controller.customer?.address?.addressId ==
                                  null)
                                Text(
                                  "请填写收货地址",
                                  style: TextStyle(
                                      fontSize: XDimens.sp32,
                                      fontWeight: FontWeight.w500),
                                )
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "收货人:",
                                          style: TextStyle(
                                              fontSize: XDimens.sp28,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          controller.customer?.name ?? "",
                                          style: TextStyle(
                                              fontSize: XDimens.sp28,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          controller.customer?.tel ?? "",
                                          style: TextStyle(
                                              fontSize: XDimens.sp26,
                                              color: XColors.tipColor),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "收货地址:",
                                          style: TextStyle(
                                              fontSize: XDimens.sp26,
                                              color: XColors.tipColor),
                                        ),
                                        Text(
                                          controller.customer?.concreteAddress,
                                          style: TextStyle(
                                              fontSize: XDimens.sp26,
                                              color: XColors.tipColor),
                                        )
                                      ],
                                    )
                                  ],
                                )
                            ],
                          );
                        },
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
            padding: EdgeInsets.only(bottom: XDimens.gap24),
            margin: EdgeInsets.only(top: XDimens.gap32),
            child: Row(
              children: [
                Container(
                  child: Text(
                    "售",
                    style: TextStyle(
                        fontSize: XDimens.sp48, fontWeight: FontWeight.w500),
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
                Container(
                  padding: EdgeInsets.only(left: XDimens.gap24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "销售员:${controller.user.nickName}",
                            style: TextStyle(
                                fontSize: XDimens.sp28,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${controller.user.userTel}",
                            style: TextStyle(
                                fontSize: XDimens.sp26,
                                color: XColors.tipColor),
                          )
                        ],
                      ),
                      Text("门店信息:${controller.user.shopName}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: XDimens.sp26,
                            color: XColors.tipColor,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
