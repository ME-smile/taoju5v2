/*
 * @Description: 商品列表页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:29:05
 * @LastEditTime: 2021-01-16 18:36:01
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/domain/model/product/product_tab_model.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_body/product_grid_mode_section.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_body/product_list_mode_section.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taojuwu/app/ui/pages/search/search_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/common/x_search_bar.dart';

import 'fragment/product_list_header.dart';

class ProductListPage extends GetView<ProductListParentController> {
  const ProductListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XSearchBar(
        onTap: () =>
            Get.toNamed(AppRoutes.search, arguments: SearchType.product),
        bottom: PreferredSize(
            child: Column(
              children: [
                TabBar(
                  controller: controller.tabController,
                  tabs: [
                    for (ProductTabModel tab in controller.tabList)
                      Text(tab.name)
                  ],
                ),
                ProductListHeader(),
              ],
            ),
            preferredSize: Size.fromHeight(48)),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          for (ProductTabModel tab in controller.tabList)
            GetBuilder<ProductListController>(
              init: ProductListController({"category_type": tab.id}),
              tag: tab.name,
              autoRemove: false,
              builder: (_) {
                return Column(
                  children: [
                    Expanded(
                      child: Scaffold(
                        key: controller.scaffoldKey,
                        endDrawer: ProductListFilterPage(),
                        endDrawerEnableOpenDragGesture: false,
                        body: XLoadStateBuilder(
                          loadState: _.loadState,
                          builder: (BuildContext context) {
                            bool isGridMode =
                                Get.find<ProductListParentController>()
                                    .isGridMode;
                            return SizedBox.expand(
                                child: isGridMode
                                    ? ProductGridModeSection(
                                        onLoading: _.load,
                                        onRefresh: _.refreshData,
                                        refreshController: _.refreshController,
                                        productList: _.productList)
                                    : ProductListModeSection(
                                        onLoading: _.load,
                                        onRefresh: _.refreshData,
                                        refreshController: _.refreshController,
                                        productList: _.productList));
                            // return SmartRefresher(
                            //   controller: _.refreshController,
                            //   enablePullDown: true,
                            //   onRefresh: _.refreshData,
                            //   enablePullUp: true,
                            //   child: GridView.builder(
                            //       itemCount: _.productList.length,
                            //       gridDelegate:
                            //           SliverGridDelegateWithFixedCrossAxisCount(
                            //               crossAxisCount: 2,
                            //               childAspectRatio: 0.84,
                            //               crossAxisSpacing: 24,
                            //               mainAxisSpacing: 24),
                            //       itemBuilder: (BuildContext context, int i) {
                            //         ProductModel e = _.productList[i];
                            //         return GestureDetector(
                            //           onTap: () => Get.toNamed(
                            //               AppRoutes.productDetail + "/${e.id}",
                            //               arguments: e.productType),
                            //           child: Container(
                            //             child: Column(
                            //               children: [
                            //                 SizedBox(
                            //                   width: 320.w,
                            //                   child: AspectRatio(
                            //                       aspectRatio: 1.0,
                            //                       child:
                            //                           Image.network(e.image)),
                            //                 ),
                            //                 Container(
                            //                   alignment: Alignment.centerLeft,
                            //                   padding: EdgeInsets.only(
                            //                       left: XDimens.gap20,
                            //                       top: XDimens.gap24),
                            //                   child: Row(
                            //                     children: [
                            //                       Text(
                            //                         e.name,
                            //                       )
                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: EdgeInsets.only(
                            //                       left: XDimens.gap20,
                            //                       top: XDimens.gap12),
                            //                   alignment: Alignment.centerLeft,
                            //                   child: Text(
                            //                       "¥${e.price.toStringAsFixed(2)}"),
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //         );
                            //       }),
                            // child: ListView.builder(
                            //     shrinkWrap: true,
                            //     itemCount: _.productList.length,
                            //     itemBuilder: (BuildContext context, int i) {
                            //       ProductModel model = _.productList[i];
                            //       return GestureDetector(
                            // onTap: () => Get.toNamed(
                            //     AppRoutes.productDetail +
                            //         "/${model.id}",
                            //     arguments: model.productType),
                            //         child: Column(
                            //           children: [
                            //             CachedNetworkImage(
                            //                 imageUrl: model.image)
                            //           ],
                            //         ),
                            //       );
                            //     }),
                            // );
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}
