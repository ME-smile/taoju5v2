/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:44:38
 * @LastEditTime: 2021-01-05 09:22:06
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
                      child: ProductDetailImageSectionView(),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: ProductDetailFooter(),
            );
          });
    });
  }
}
