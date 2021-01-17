/*
 * @Description: app模块
 * @Author: iamsmiling
 * @Date: 2021-01-12 10:01:50
 * @LastEditTime: 2021-01-12 10:30:50
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/home/home_controller.dart';
import 'package:taojuwu/app/ui/pages/home/widget/app_module_card.dart';

class HomePageBody extends GetView<HomeController> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: XDimens.gap24, left: XDimens.gap24, right: XDimens.gap24),
      child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: controller.moduleList
              .map((module) => AppModuleCard(
                    module: module,
                  ))
              ?.toList(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: XDimens.gap24,
              mainAxisSpacing: XDimens.gap32,
              childAspectRatio: 1.2)),
    );
  }
}
