/*
 * @Description: 设置页面的头部
 * @Author: iamsmiling
 * @Date: 2021-01-07 21:41:14
 * @LastEditTime: 2021-01-07 21:47:21
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/ui/pages/setting/setting/setting_controller.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 64.sp,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [Text(_.user.nickName), Text(_.user.userTel)],
                ),
                Text(_.user.shopName)
              ],
            ))
          ],
        ),
      );
    });
  }
}
