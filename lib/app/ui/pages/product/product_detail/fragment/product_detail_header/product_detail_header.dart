/*
 * @Description:商品详情头部
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:12:26
 * @LastEditTime: 2021-01-16 13:16:37
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_share_button.dart';

class ProductDetailHeader extends GetView<ProductDetailController> {
  const ProductDetailHeader({Key key}) : super(key: key);

  ProductDetailModel get product => controller.detailModel;
  static const List<String> tipList = ["全球设计", "上门测量", "上门安装", "贴心售后"];
  @override
  Widget build(BuildContext context) {
    // ThemeData themeData = Theme.of(context);
    // TextTheme textTheme = themeData.textTheme;
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: XDimens.gap16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: TextStyle(
                    fontSize: XDimens.sp32, fontWeight: FontWeight.w500),
              ),
              XShareButton()
            ],
          ),
          Visibility(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: XDimens.gap4),
              child: Text(
                "${product.fullName}",
                style: TextStyle(fontSize: XDimens.sp28),
              ),
            ),
            visible: !GetUtils.isNullOrBlank(product.fullName),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: XDimens.gap8),
            child: Row(
              children: [
                Text(
                  "¥${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: XDimens.sp36, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${product.unit}",
                  style: TextStyle(fontSize: XDimens.sp24),
                ),
                Padding(
                  padding: EdgeInsets.only(left: XDimens.gap8),
                  child: Text(
                    "¥${product.marketPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: XDimens.sp24,
                        color: product.marketPrice == 0
                            ? Colors.transparent
                            : XColors.tipColor),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: product.productType is CurtainProductType,
            child: Container(
              color: XColors.lightBlueColor,
              padding: EdgeInsets.symmetric(vertical: XDimens.gap8),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: XDimens.gap16),
                    child: Text(
                      "·",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: XColors.blueTextColor,
                          fontSize: 24),
                    ),
                  ),
                  Text(
                    "该商品为定制商品，此价格为米价",
                    style: TextStyle(
                      color: XColors.blueTextColor,
                      fontSize: XDimens.sp24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: XDimens.gap12),
            child: DefaultTextStyle(
              style: TextStyle(color: XColors.tipTextColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (String e in tipList)
                    Container(
                      padding: EdgeInsets.only(right: XDimens.gap10),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: XDimens.gap16),
                            child: Text(
                              "·",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                          ),
                          Text(e)
                        ],
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
