/*
 * @Description: 首页顶部
 * @Author: iamsmiling
 * @Date: 2021-01-12 09:50:13
 * @LastEditTime: 2021-01-12 10:37:30
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/home/user_provider_controller.dart';
import 'package:taojuwu/app/utils/common_kit.dart';

class HomePageHeader extends GetView<UserProviderController> {
  const HomePageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: XDimens.gap32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.greetWord},${controller.user.nickName}",
            style: TextStyle(
              fontSize: XDimens.sp36,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("${controller.user.shopName}",
              style: TextStyle(
                  fontSize: XDimens.sp24, color: XColors.subTitleColor)),
          Container(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.productList),
              child: AspectRatio(
                aspectRatio: 1.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: CachedNetworkImage(
                      width: Get.width,
                      imageUrl: CommonKit.asWebUrl("upload/master.jpg")),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
