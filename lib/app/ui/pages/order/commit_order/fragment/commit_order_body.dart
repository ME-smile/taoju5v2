/*
 * @Description: 提交订单主体内容
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:14:53
 * @LastEditTime: 2021-01-16 14:06:23
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_adapter_model.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommitOrderBody extends GetView<CommitOrderController> {
  const CommitOrderBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(controller.productList),
      child: Container(
        color: XColors.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: XDimens.gap32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (ProductAdapterModel product in controller.productList)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: product.productType is CurtainProductType &&
                        !GetUtils.isNullOrBlank(product?.room),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: XDimens.gap20),
                      child: Text(
                        product.room ?? "",
                        style: TextStyle(
                            fontSize: XDimens.sp28,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 180.w,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: CachedNetworkImage(imageUrl: product.image),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(product.name),
                            Text(product.description ?? ""),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
