/*
 * @Description:商品列表 网格模式视图
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:17:59
 * @LastEditTime: 2021-01-15 15:44:44
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridModeSection extends StatelessWidget {
  final RefreshController refreshController;
  final bool enablePullDown;
  final bool enablePullUp;
  final Function onRefresh;
  final Function onLoading;
  final List<ProductModel> productList;
  final bool shrinkWrap;
  const ProductGridModeSection(
      {Key key,
      @required this.refreshController,
      this.enablePullDown = true,
      this.enablePullUp = true,
      this.onRefresh,
      this.onLoading,
      @required this.productList,
      this.shrinkWrap = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: onRefresh,
      onLoading: onLoading,
      controller: refreshController,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      child: GridView.builder(
          shrinkWrap: shrinkWrap,
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.84,
            // crossAxisSpacing: 24,
          ),
          itemBuilder: (BuildContext context, int i) {
            ProductModel e = productList[i];
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.productDetail + "/${e.id}",
                  arguments: e.productType),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      width: 320.w,
                      child: AspectRatio(
                          aspectRatio: 1.0, child: Image.network(e.image)),
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
          }),
    );
  }
}
