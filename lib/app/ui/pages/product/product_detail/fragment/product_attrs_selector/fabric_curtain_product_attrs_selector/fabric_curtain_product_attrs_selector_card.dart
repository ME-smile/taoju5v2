/*
 * @Description: 布艺帘商品属性选择卡片
 * @Author: iamsmiling
 * @Date: 2020-12-22 17:37:04
 * @LastEditTime: 2020-12-29 17:37:51
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/fabric_curtain_product_attrs_selector/fabirc_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_pridce_delegator.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/widgets/craft_attr_selector_bar.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/widgets/gauze_attr_selector_bar.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/widgets/sectionalbar_attr_selector_bar.dart';

class FabircCurtainProductAttrsSelectorCard extends StatelessWidget {
  const FabircCurtainProductAttrsSelectorCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FabricCurtainProductAttrSelectorController>(
        initState: (State state) {
      ProductDetailController productDetailController =
          Get.find<ProductDetailController>();
      productDetailController.selectorController =
          Get.find<FabricCurtainProductAttrSelectorController>();
      productDetailController.priceDelegator =
          FabricCurtainProductPriceDelegator();
    }, builder: (_) {
      return Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(XDimens.gap32),
        child: Column(
          children: [
            GestureDetector(
                onTap: () =>
                    Get.toNamed(AppRoutes.editMeasureData, arguments: _),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: GetBuilder<FabricCurtainProductAttrSelectorController>(
                    id: "size",
                    builder: (_) {
                      return Row(
                        children: [
                          Text.rich(TextSpan(
                              text: "*",
                              style: TextStyle(
                                color: XColors.warningColor,
                              ),
                              children: [
                                WidgetSpan(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: XDimens.gap12),
                                  child: Text(
                                      _.isSizeBlank ? "请预填测装数据" : "已预填测装数据"),
                                )),
                              ])),
                          Spacer(),
                          Visibility(
                            child: Text(
                              _.tip,
                              textAlign: TextAlign.end,
                            ),
                            visible: !_.isSizeBlank,
                          )
                        ],
                      );
                    },
                  ),
                )),
            // RoomAttrSelectorBar(controller: _),
            GauzeAttrSelectorBar(controller: _),
            CraftAttrSelectorBar(controller: _),
            SectionalAttrSelectorBar(controller: _),
          ],
        ),
      );
    });
  }
}
