/*
 * @Description: 订单列表页面
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:24:06
 * @LastEditTime: 2021-01-08 09:45:37
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taojuwu/app/domain/model/order/order_model.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taojuwu/app/ui/pages/order/order_list/widgets/order_card.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_rotation_arrow.dart';

class OrderListPage extends GetView<OrderListParentController> {
  const OrderListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单列表"),
        bottom: PreferredSize(
            child: Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    TabBar(
                        controller: controller.tabController,
                        isScrollable: true,
                        tabs: [
                          for (OrderStatusTabModel tab in controller.tabList)
                            Obx(() => Text("${tab.name}(${tab.count.value})"))
                        ]),
                    Positioned(
                        right: 0,
                        child: Row(
                          children: [
                            XRotationArrow(
                              onTap: () => controller.filter(context),
                            )
                          ],
                        ))
                  ],
                );
              },
            ),
            preferredSize: Size.fromHeight(36.0)),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          for (OrderStatusTabModel tab in controller.tabList)
            GetBuilder(
              init: OrderListController(status: tab.status),
              tag: tab.status,
              autoRemove: false,
              builder: (_) {
                return XLoadStateBuilder(
                    loadState: _.loadState,
                    builder: (BuildContext context) {
                      return SmartRefresher(
                        controller: _.refreshController,
                        onRefresh: _.refreshData,
                        onLoading: _.loadMore,
                        enablePullDown: true,
                        enablePullUp: true,
                        child: ListView.separated(
                            separatorBuilder: (BuildContext context, int i) {
                              return Divider(
                                height: XDimens.gap16,
                              );
                            },
                            itemCount: _.orderList.length,
                            itemBuilder: (BuildContext context, int i) {
                              OrderModel e = _.orderList[i];
                              return OrderCard(order: e);
                            }),
                      );
                    });
              },
            )
        ],
      ),
    );
  }
}
