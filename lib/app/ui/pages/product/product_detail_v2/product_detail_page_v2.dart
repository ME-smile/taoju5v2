/*
 * @Description:改版后的商品详情
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:44:47
 * @LastEditTime: 2021-01-10 21:06:58
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_mix_section/product_mix_section.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/recommend_product_section/recommend_product_section.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/scene_design_product_section/scene_design_product_section.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/soft_design_product_section/soft_design_product_section.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/product_detail_controller_v2.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/product_detail_header/product_detail_header_v2.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_customer_choose_button.dart';

import 'fragment/product_detail_banner/product_detail_banner_section_card_v2.dart';
import 'fragment/product_detail_footer_v2/product_detail_footer_v2.dart';

class ProductDetailPageV2 extends StatelessWidget {
  const ProductDetailPageV2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailControllerV2>(
        tag: Get.parameters["id"],
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              builder: (BuildContext context) {
                return Scaffold(
                  bottomNavigationBar: ProductDetailFooterV2(),
                  body: NestedScrollView(
                    controller: _.scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                            expandedHeight: 320,
                            elevation: .5,
                            floating: true,
                            pinned: false,
                            actions: [XCustomerChooseButton()],
                            flexibleSpace: FlexibleSpaceBar(
                              background: ProductDetailBannerCardV2(
                                imageList: _.product.imgList,
                              ),
                            ))
                      ];
                    },
                    body: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: ProductDetailHeaderV2(
                            product: _.product,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Divider(
                            height: XDimens.gap16,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Visibility(
                            visible: _.product is CurtainProductType,
                            child: GestureDetector(
                              onTap: () => Get.toNamed(
                                  AppRoutes.productQuotation,
                                  arguments: _.product),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: XDimens.gap16,
                                    vertical: XDimens.gap16),
                                color: Theme.of(context).primaryColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("输入尺寸及配件查看报价"),
                                    Icon(XIcons.next)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SliverToBoxAdapter(
                        //   child: ProductDetailImageSectionView(),
                        // ),
                        SliverToBoxAdapter(
                          child: Divider(
                            height: XDimens.gap16,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ProductMixSection(
                            productList: _.mixedProductList,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Divider(
                            height: XDimens.gap16,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SceneDesignProductSection(
                            productList: _.sceneDesignProductList,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Divider(
                            height: XDimens.gap16,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SoftDesignProductSection(
                            productList: _.sceneDesignProductList,
                          ),
                        ),

                        SliverToBoxAdapter(
                          child: RecommendProductSection(
                            productList: _.recomendProductList,
                            scrollController: _.scrollController,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
