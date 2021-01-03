/*
 * @Description: 商品列表页面头部
 * @Author: iamsmiling
 * @Date: 2020-12-25 13:31:14
 * @LastEditTime: 2020-12-25 17:03:28
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_rotation_arrow.dart';

import '../product_list_controller.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder(
            builder: (_) {
              return Row(
                children: [
                  Container(
                    child: Image.asset(
                        AppConfig.assetImagePrefixPath + "grid_mode.png"),
                  ),
                  Container(
                    child: Image.asset(
                        AppConfig.assetImagePrefixPath + "list_mode.png"),
                  ),
                ],
              );
            },
          ),
          GetBuilder<ProductListController>(
            id: "sort",
            builder: (_) {
              return Row(
                children: [
                  XRotationArrow(
                    label: _.sortModel.name,
                    onTap: () => _.sort(context),
                  ),
                  GestureDetector(
                    onTap: () => _.filter(context),
                    child: Row(
                      children: [
                        Text("筛选"),
                        Image.asset(
                            AppConfig.assetImagePrefixPath + "filter.png")
                      ],
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
