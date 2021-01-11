/*
 * @Description: 商品报价单
 * @Author: iamsmiling
 * @Date: 2021-01-08 15:00:36
 * @LastEditTime: 2021-01-10 23:15:11
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/subpage/product_quotation/product_quotation_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_rotation_arrow.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_selector_text_field.dart';

class ProductQuotationPage extends GetView<ProductQuotationController> {
  const ProductQuotationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("${controller.product.name}报价单"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              height: 480.h,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(AppConfig.assetImagePrefixPath +
                      "curtain/size_000001.png"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: XDimens.gap16),
              child: Column(
                children: [
                  XSelectorTextField(label: Text("安装位置:")),
                  XSelectorTextField(label: Text("窗   型:")),
                  XSelectorTextField(label: Text("* 墙体尺寸")),
                  XSelectorTextField(label: Text("打开方式:")),
                  XSelectorTextField(label: Text("窗帘:")),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: XDimens.gap16, vertical: XDimens.gap16),
              width: Get.width,
              color: XColors.scaffoldBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("* 窗帘相关配件"),
                      XRotationArrow(
                        onTap: controller.select,
                      )
                    ],
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("预计"),
            ElevatedButton(onPressed: () {}, child: Text("确认"))
          ],
        ),
      ),
    );
  }
}
