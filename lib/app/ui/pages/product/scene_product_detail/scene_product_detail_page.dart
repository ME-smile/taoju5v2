/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:47:50
 * @LastEditTime: 2021-01-10 21:53:11
 */

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/common/x_photo_viewer.dart';

import 'scene_product_detail_controller.dart';

class SceneProductDetailPage extends StatelessWidget {
  const SceneProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("相关场景"),
      ),
      body: GetBuilder<SceneProductDetailController>(
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: XDimens.gap16),
                  child: Column(
                    children: [
                      XPhotoViewer(
                        url: _.product.image,
                        bigImageUrl: _.product.bigImage,
                      ),
                      Container(
                        child: Text(
                          _.product.description,
                          style: TextStyle(letterSpacing: 1, height: 1.5),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Chip(label: Text(_.product.room)),
                            Chip(label: Text(_.product.style)),
                          ],
                        ),
                      ),
                      Text("相关商品"),
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
                            childAspectRatio: 0.68,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                      ),
                      Text("场景推荐"),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
