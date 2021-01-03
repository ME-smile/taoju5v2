/*
 * @Description: 订单列表页面
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:24:06
 * @LastEditTime: 2020-12-22 15:42:55
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/domain/model/order/order_model.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单列表"),
      ),
      body: GetBuilder<OrderListController>(
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              builder: (BuildContext context) {
                List<OrderModel> list = _.wrapper.orderModelList;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int i) {
                      OrderModel e = list[i];
                      return GestureDetector(
                          onTap: () =>
                              Get.toNamed(AppRoutes.orderDetail + "/${e.id}"),
                          child: Column(
                            children: [
                              for (OrderProductModel model in e.productList)
                                Row(
                                  children: [
                                    CachedNetworkImage(imageUrl: model.image),
                                    Column(
                                      children: [Text(model.name)],
                                    )
                                  ],
                                )
                            ],
                          ));
                    });
              });
        },
      ),
    );
  }
}
