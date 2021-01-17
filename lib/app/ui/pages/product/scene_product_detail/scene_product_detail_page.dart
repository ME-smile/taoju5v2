/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:47:50
 * @LastEditTime: 2021-01-15 15:08:29
 */

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_cart_button.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_customer_choose_button.dart';
import 'package:taojuwu/app/ui/widgets/common/x_photo_viewer.dart';

import 'scene_product_detail_controller.dart';
import 'widget/x_tag_chip.dart';

class SceneProductDetailPage extends StatelessWidget {
  const SceneProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("相关场景"),
        actions: [XCustomerChooseButton()],
      ),
      body: GetBuilder<SceneProductDetailController>(
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: XDimens.gap16),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XPhotoViewer(
                        url: _.product.image,
                        bigImageUrl: _.product.bigImage,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: XDimens.gap32),
                        child: Text(
                          _.product.description,
                          style: TextStyle(
                              letterSpacing: 1,
                              height: 1.5,
                              fontSize: XDimens.sp28,
                              color: XColors.descriptionTextColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: XDimens.gap12),
                        child: Row(
                          children: [
                            XTagChip(tag: _.product.room),
                            SizedBox(width: XDimens.gap24),
                            XTagChip(tag: _.product.style)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: XDimens.gap32),
                        child: Text(
                          "相关商品",
                          style: TextStyle(
                              color: XColors.titleColor,
                              fontSize: XDimens.sp28,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _.product.productList.length,
                        itemBuilder: (BuildContext context, int i) {
                          ProductModel e = _.product.productList[i];
                          return Container(
                            child: Image.network(e.image),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: XDimens.gap36),
                              child: XCartButton(
                                imageUrl: AppConfig.assetImagePrefixPath +
                                    "product_detail_cart.png",
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text("立即购买"))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: XDimens.gap32),
                        child: Text(
                          "场景推荐",
                          style: TextStyle(
                              color: XColors.titleColor,
                              fontSize: XDimens.sp28,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
