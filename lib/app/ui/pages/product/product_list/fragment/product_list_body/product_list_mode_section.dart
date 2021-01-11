/*
 * @Description: 商品列表 列表模式视图
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:09:44
 * @LastEditTime: 2021-01-08 13:25:47
 */
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';

class ProductListModeSection extends StatelessWidget {
  final RefreshController refreshController;
  final bool enablePullDown;
  final bool enablePullUp;
  final Function onRefresh;
  final Function onLoading;
  final List<ProductModel> productList;
  final bool shrinkWrap;
  const ProductListModeSection(
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
      child: ListView.builder(
          shrinkWrap: shrinkWrap,
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int i) {
            ProductModel e = productList[i];
            return Container(
              child: Column(
                children: [Image.network(e.image)],
              ),
            );
          }),
    );
  }
}
