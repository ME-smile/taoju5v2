/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:44:38
 * @LastEditTime: 2021-01-15 15:51:12
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_detail_banner/product_detail_banner_section_card.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_detail_header/product_detail_header.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_customer_choose_button.dart';
import 'fragment/product_attrs_selector/product_attrs_selector_card.dart';
import 'fragment/product_detail_footer/product_detail_footer.dart';
import 'fragment/product_detail_image_section_view/product_detail_image_section_view.dart';
import 'fragment/product_mix_section/product_mix_section.dart';
import 'fragment/recommend_product_section/recommend_product_section.dart';
import 'fragment/scene_design_product_section/scene_design_product_section.dart';
import 'fragment/soft_design_product_section/soft_design_product_section.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return XLoadStateBuilder(
          loadState: _.loadState,
          builder: (BuildContext context) {
            return Scaffold(
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
                          background: ProductDetailBannerCard(),
                        ))
                  ];
                },
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ProductDetailHeader(),
                    ),
                    SliverToBoxAdapter(
                      child: ProductAttrsSelectorCard(),
                    ),
                    SliverToBoxAdapter(
                      child: ProductMixSection(
                        productList: _.mixedProductList,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SceneDesignProductSection(
                        productList: _.sceneDesignProductList,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SoftDesignProductSection(
                        productList: _.sceneDesignProductList,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProductDetailImageSectionView(),
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
              bottomNavigationBar: ProductDetailFooter(),
            );
          });
    });
  }
}
