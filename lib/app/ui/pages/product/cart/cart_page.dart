/*
 * @Description: 购物车页面
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:27:58
 * @LastEditTime: 2021-01-16 13:46:04
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/cart_product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_attr_model.dart';
import 'package:taojuwu/app/domain/model/product/product_tab_model.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/ui/modal/product/finished_product.dart';
import 'package:taojuwu/app/ui/pages/product/cart/cart_list_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_step_counter.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_rotation_arrow.dart';

class CartPage extends GetView<CartListParentController> {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: [
              for (ProductTabModel tab in controller.tabList) Text(tab.name)
            ],
          ),
        ),
        body: TabBarView(controller: controller.tabController, children: [
          for (ProductTabModel tab in controller.tabList)
            GetBuilder<CartListController>(
                tag: tab.name,
                autoRemove: false,
                builder: (_) {
                  return ListView.separated(
                      itemCount: _.cartList.length,
                      separatorBuilder: (BuildContext context, int i) {
                        return Divider(
                          height: XDimens.gap16,
                          thickness: XDimens.gap16,
                        );
                      },
                      itemBuilder: (BuildContext context, int i) {
                        CartPorductModel e = _.cartList[i];
                        return Container(
                          color: XColors.primaryColor,
                          padding: EdgeInsets.all(XDimens.gap16),
                          child: Column(
                            children: [
                              Obx(() => Row(
                                    children: [
                                      Checkbox(
                                          // key: ObjectKey(e.id),
                                          value: e.isChecked.value,
                                          onChanged: (bool flag) =>
                                              _.checkItem(e, flag)),
                                      Container(
                                        width: 180.w,
                                        margin: EdgeInsets.only(
                                            right: XDimens.gap20),
                                        child: AspectRatio(
                                          aspectRatio: 1.0,
                                          child: CachedNetworkImage(
                                            imageUrl: e.image,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${e.productName}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: XDimens.sp28),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "¥${e.totalPrice}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: XDimens.sp28),
                                                ),
                                                Text("${e.unit ?? ""}"),
                                              ],
                                            ),
                                            Visibility(
                                              visible: e.productType
                                                  is CurtainProductType,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: XDimens.gap20),
                                                child: Text(
                                                  "${e.description}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 5,
                                                  style: TextStyle(
                                                      fontSize: XDimens.sp24,
                                                      color: XColors
                                                          .descriptionTextColor),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: e.productType
                                                  is FinishedProductType,
                                              child: Container(
                                                  color:
                                                      XColors.scaffoldBgColor,
                                                  // padding: EdgeInsets.zero,
                                                  // margin: EdgeInsets.only(
                                                  //     top: XDimens.gap20),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "${e.description}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            height: .5,
                                                            fontSize:
                                                                XDimens.sp24,
                                                            color: XColors
                                                                .descriptionTextColor),
                                                      ),
                                                      XRotationArrow(
                                                          onTap: () =>
                                                              showFinishedProductAttrModal(
                                                                  context,
                                                                  id: e
                                                                      .productId))
                                                    ],
                                                  )),
                                            ),
                                            Visibility(
                                              child: Container(
                                                width: Get.width,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: XStepCounter(),
                                              ),
                                              visible: e.productType
                                                  is FinishedProductType,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Visibility(
                                visible: !GetUtils.isNullOrBlank(e.attrsList),
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: XDimens.gap16,
                                        horizontal: XDimens.gap24),
                                    color: XColors.scaffoldBgColor,
                                    margin: EdgeInsets.only(
                                        left: 42,
                                        top: 20,
                                        bottom: XDimens.gap36),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            itemCount: e.attrsList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              ProductAttrAdapterModel item =
                                                  e.attrsList[index];
                                              return Text(
                                                "${item.key}:${item.value}",
                                                style: TextStyle(
                                                    color: XColors
                                                        .descriptionTextColor,
                                                    fontSize: XDimens.sp24),
                                              );
                                            },
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 0,
                                                    crossAxisSpacing: 0,
                                                    childAspectRatio: 8),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Icon(XIcons.next),
                                          onTap: () {},
                                        )
                                      ],
                                    )),
                              ),
                              Visibility(
                                visible: e.productType is CurtainProductType,
                                child: Container(
                                  width: Get.width,
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "预计总金额:",
                                        style: TextStyle(
                                            fontSize: XDimens.sp26,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "¥${e.totalPrice.toStringAsFixed(2)}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: XDimens.sp32),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                })
        ]),
        bottomNavigationBar: Row(
          // key: ValueKey(controller.totalPrice),
          children: [
            GetBuilder<CartListParentController>(
                id: "isCheckedAll",
                builder: (_) {
                  return Row(
                    children: [
                      Checkbox(
                        key: ValueKey(controller.isCheckedAll),
                        onChanged: (bool flag) {
                          _.isCheckedAll = flag;
                          _.update(["isCheckedAll"]);
                          print(controller.isCheckedAll);
                        },
                        value: controller.isCheckedAll,
                      ),
                      Text("全选"),
                    ],
                  );
                }),
            GetBuilder<CartListParentController>(
                id: "totalPrice",
                builder: (_) {
                  return Text("${_.totalPrice.toStringAsFixed(2)}");
                }),
            Spacer(),

            ElevatedButton(onPressed: controller.commit, child: Text("提交订单"))
            // Obx(() {
            //   return Checkbox(
            //     key: ValueKey(controller.isCheckedAll),
            //     onChanged: (bool flag) {
            //       controller.isCheckedAll = flag;
            //       print(controller.isCheckedAll);
            //     },
            //     value: controller.isCheckedAll.value,
            //   );
            // }),
          ],
        )
        // bottomNavigationBar: Obx(() {
        //   print(controller.totalPrice);
        //   return Row(
        //     key: ValueKey(controller.tag +
        //         "${controller.totalPrice.value.toStringAsFixed(2)}"),
        //     children: [
        //       Checkbox(
        //           value: controller.isCheckedAll.value,
        //           onChanged: (bool flag) {
        //             controller.isCheckedAll = flag;
        //           }),
        //       Text("全选"),
        //       Text(
        //         controller.totalPrice.value.toStringAsFixed(2),
        //       )
        //     ],
        //   );
        // }),
        // body: GetBuilder(
        //   init: CartListController(),
        //   builder: (_){

        //   },
        // ),
        );
  }
}
