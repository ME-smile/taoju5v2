/*
 * @Description: App功能模块
 * @Author: iamsmiling
 * @Date: 2021-01-12 10:16:53
 * @LastEditTime: 2021-01-12 22:45:22
 */
import 'package:flutter/material.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/domain/model/app/app_module_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';

class AppModuleCard extends StatelessWidget {
  final AppModuleModel module;
  const AppModuleCard({Key key, @required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: module.onTap,
      child: Card(
        color: XColors.cardColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: XDimens.gap24),
              child: Image.asset(AppConfig.assetImagePrefixPath + module.icon),
            ),
            FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: XDimens.gap8),
                    child: Text(
                      module.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: XColors.headlineColor,
                          fontSize: XDimens.sp28),
                    ),
                  ),
                  Text(
                    module.description,
                    style: TextStyle(fontSize: XDimens.sp22),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
