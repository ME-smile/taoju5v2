/*
 * @Description: 购物车页面
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:27:58
 * @LastEditTime: 2021-01-10 22:53:13
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/cart_product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_tab_model.dart';
import 'package:taojuwu/app/ui/pages/product/cart/cart_list_controller.dart';

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
                  return ListView.builder(
                      itemCount: _.cartList.length,
                      itemBuilder: (BuildContext context, int i) {
                        CartPorductModel e = _.cartList[i];
                        return Column(
                          children: [
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                        // key: ObjectKey(e.id),
                                        value: e.isChecked.value,
                                        onChanged: (bool flag) {
                                          e.isChecked.value = flag;
                                        }),
                                    Flexible(child: Image.network(e.image)),
                                    Text("${e.totalPrice}")
                                  ],
                                ))
                          ],
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
                  return Checkbox(
                    key: ValueKey(controller.isCheckedAll),
                    onChanged: (bool flag) {
                      _.isCheckedAll = flag;
                      _.update(["isCheckedAll"]);
                      print(controller.isCheckedAll);
                    },
                    value: controller.isCheckedAll,
                  );
                }),
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
            Text("全选")
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
