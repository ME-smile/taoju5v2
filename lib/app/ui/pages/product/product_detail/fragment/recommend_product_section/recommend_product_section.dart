/*
 * @Description: 为你推荐
 * @Author: iamsmiling
 * @Date: 2021-01-08 17:27:57
 * @LastEditTime: 2021-01-09 18:53:35
 */

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendProductSection extends StatelessWidget {
  final List<ProductModel> productList;
  final ScrollController scrollController;
  const RecommendProductSection(
      {Key key, this.productList = const [], @required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("为你推荐"),
          Flexible(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: productList.length,
                  physics: NeverScrollableScrollPhysics(),
                  // controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.84,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24),
                  itemBuilder: (BuildContext context, int i) {
                    ProductModel e = productList[i];
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                          AppRoutes.productDetailV2 + "/${e.id}",
                          arguments: e.productType),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 320.w,
                              child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.network(e.image)),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  left: XDimens.gap20, top: XDimens.gap24),
                              child: Row(
                                children: [
                                  Text(
                                    e.name,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: XDimens.gap20, top: XDimens.gap12),
                              alignment: Alignment.centerLeft,
                              child: Text("¥${e.price.toStringAsFixed(2)}"),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
