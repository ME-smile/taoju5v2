/*
 * @Description: 场景推荐
 * @Author: iamsmiling
 * @Date: 2021-01-08 17:25:08
 * @LastEditTime: 2021-01-15 15:50:09
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/domain/model/product/design_product_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/routes/app_pages.dart';

class SceneDesignProductSection extends StatelessWidget {
  final List<DesignProductModel> productList;
  const SceneDesignProductSection({Key key, this.productList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Container(
        margin: EdgeInsets.only(top: XDimens.gap16),
        padding: EdgeInsets.symmetric(
            horizontal: XDimens.gap16, vertical: XDimens.gap16),
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: XDimens.gap24),
              child: Row(
                children: [
                  Text("场景推荐",
                      style: TextStyle(
                          fontSize: XDimens.sp28, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text("查看更多"),
                  Icon(XIcons.next)
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 1.36,
              // height: 420.h,
              child: Swiper(
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int i) {
                  DesignProductModel e = productList[i];
                  return GestureDetector(
                      onTap: () => Get.toNamed(
                          AppRoutes.sceneProductDetail + "/${e.id}"),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  width: Get.width,
                                  fit: BoxFit.fitHeight,
                                  imageUrl: e.image,
                                ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Image.asset(
                                      AppConfig.assetImagePrefixPath +
                                          "shadow_mask.png",
                                      width: Get.width,
                                      fit: BoxFit.fitWidth,
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: EdgeInsets.all(XDimens.gap32),
                                      child: Text("${e.tag}",
                                          style: TextStyle(
                                              color: XColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: XDimens.sp28)),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
