/*
 * @Description: 改版后的商品详情
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:43:43
 * @LastEditTime: 2021-01-10 22:13:40
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';

class ProductDetailHeaderV2 extends StatelessWidget {
  final ProductDetailModel product;
  const ProductDetailHeaderV2({Key key, @required this.product})
      : super(key: key);
  static const List<String> tipList = ["全球设计", "上门测量", "上门安装", "贴心售后"];
  @override
  Widget build(BuildContext context) {
    return Visibility(
      // visible: product.type is CurtainProductType,
      child: Container(
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
                      fontSize: XDimens.sp28, fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon:
                      Image.asset(AppConfig.assetImagePrefixPath + "share.png"),
                  onPressed: () {},
                )
              ],
            ),
            Visibility(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: XDimens.gap8),
                child: Text(
                  "单色优雅遮光窗帘",
                  style: TextStyle(fontSize: XDimens.sp28),
                ),
              ),
              visible: !GetUtils.isNullOrBlank(Text(product.fullName)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
              child: Row(
                children: [
                  Text(
                    "¥${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: XDimens.sp32, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: XDimens.gap16),
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
      ),
    );
  }
}
