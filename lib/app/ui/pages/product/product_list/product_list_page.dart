/*
 * @Description: 商品列表页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:29:05
 * @LastEditTime: 2020-12-28 22:22:10
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/common/x_search_bar.dart';

import 'fragment/product_list_header.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XSearchBar(),
      body: GetBuilder<ProductListController>(
        builder: (_) {
          return XLoadStateBuilder(
            loadState: _.loadState,
            builder: (BuildContext context) {
              return Column(
                children: [
                  ProductListHeader(),
                  Expanded(
                    child: Scaffold(
                      key: _.scaffoldKey,
                      endDrawer: ProductListFilterPage(),
                      endDrawerEnableOpenDragGesture: false,
                      body: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _.productList.length,
                          itemBuilder: (BuildContext context, int i) {
                            ProductModel model = _.productList[i];
                            return GestureDetector(
                              onTap: () => Get.toNamed(
                                  AppRoutes.productDetail + "/${model.id}",
                                  arguments: model.productType),
                              child: Column(
                                children: [
                                  CachedNetworkImage(imageUrl: model.image)
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
