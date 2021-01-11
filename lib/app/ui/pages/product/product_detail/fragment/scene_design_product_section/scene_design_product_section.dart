/*
 * @Description: 场景推荐
 * @Author: iamsmiling
 * @Date: 2021-01-08 17:25:08
 * @LastEditTime: 2021-01-10 14:10:34
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/design_product_model.dart';
import 'package:taojuwu/app/res/x_icons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                Text("场景推荐"),
                Spacer(),
                Text("查看更多"),
                Icon(XIcons.next)
              ],
            ),
            Container(
              height: 420.h,
              child: Swiper(
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int i) {
                  DesignProductModel e = productList[i];
                  return GestureDetector(
                      onTap: () => Get.toNamed(
                          AppRoutes.sceneProductDetail + "/${e.id}"),
                      child: Image.network(e.image));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
