/*
 * @Description: 成品弹窗看了,2.
 * 3.69++326
 * @Author: iamsmiling
 * @Date: 2021-01-15 22:59:59
 * @LastEditTime: 2021-01-15 23:56:21
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/modal/base/x_base_modal.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/finished_product_attrs_selector/finished_product_attrs_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_step_counter.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_check_button.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_submit_button.dart';

Future showFinishedProductAttrModal(BuildContext context,
    {ProductDetailModel product, int id}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return XBaseModal(builder: (BuildContext context) {
          return GetBuilder<FinishedProductAttrsController>(
              init: FinishedProductAttrsController(product: product, id: id),
              builder: (_) {
                return XLoadStateBuilder(
                    loadState: _.loadState,
                    builder: (BuildContext context) {
                      return Scaffold(
                        body: Container(
                          margin: EdgeInsets.all(XDimens.gap32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: XDimens.gap24),
                                      width: 180.w,
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: CachedNetworkImage(
                                            imageUrl: _.product.cover),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "¥${_.product.price.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontSize: XDimens.sp36,
                                              fontWeight: FontWeight.w500,
                                              color: XColors.highLightColor),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: XDimens.gap20),
                                          child: Text(
                                            ("${_.product.currentSpecOptionName ?? ""}"),
                                            style: TextStyle(
                                                fontSize: XDimens.sp28,
                                                color: XColors
                                                    .descriptionTextColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: XDimens.gap24),
                                  child: Divider()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: XDimens.gap24),
                                child: Text(
                                  "数量:",
                                  style: TextStyle(
                                      fontSize: XDimens.sp28,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              XStepCounter(
                                  onChanged: null,
                                  onSubstract: null,
                                  onPlus: null),
                              for (ProductSpecModel spec in _.product.specList)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: XDimens.gap24),
                                      child: Text(
                                        "${spec.name}:",
                                        style: TextStyle(
                                            fontSize: XDimens.sp28,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        for (ProductSpecOptionModel option
                                            in spec.optionList)
                                          XCheckButton(
                                              target: option,
                                              callback: () => _.select(option),
                                              child: Text("${option.name}"))
                                      ],
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                        bottomNavigationBar: XSubmitButton(
                            child: Text("确定"),
                            onFuture: () => Future.value(false)),
                      );
                    });
              });
        });
      });
}
