/*
 * @Description:布艺帘商品
 * @Author: iamsmiling
 * @Date: 2021-01-08 15:33:42
 * @LastEditTime: 2021-01-08 16:33:32
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/subpage/fabric_curtain_product_attr/fabric_curtain_product_attr_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FabricCurtainProductAttrPage extends StatelessWidget {
  const FabricCurtainProductAttrPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FabricCurtainProductAttrController>(
      init: FabricCurtainProductAttrController(),
      autoRemove: false,
      builder: (_) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Container(
            height: .72 * Get.height,
            color: Theme.of(context).primaryColor,
            child: Scaffold(
              body: Stack(
                children: [
                  Positioned(
                      right: 0,
                      child: IconButton(
                        icon: Icon(XIcons.close),
                        onPressed: Get.back,
                      )),
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 180.h,
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Image.network(_.product?.cover),
                              ),
                            ),
                            Column(
                              children: [
                                Text(_.product?.name),
                                Text(_.product?.price?.toStringAsFixed(2)),
                                Text("已选")
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: XDimens.gap16,
                      ),
                      DefaultTabController(
                          length: _.tabList.length,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TabBar(
                                  tabs: [for (String e in _.tabList) Text(e)]),
                              SizedBox(
                                height: 480.h,
                                child: TabBarView(
                                  children: [
                                    for (String e in _.tabList) Text(e)
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
              bottomNavigationBar: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("总价"),
                    ElevatedButton(onPressed: Get.back, child: Text("确定"))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
