/*
 * @Description: 商品详情页
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:35:39
 * @LastEditTime: 2021-01-13 15:57:40
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/fragment/order_datail_footer.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';

import 'fragment/order_action_tip_bar.dart';
import 'fragment/order_detail_body.dart';
import 'fragment/order_detail_bottom_action_bar.dart';
import 'fragment/order_detail_header.dart';
import 'fragment/order_detail_sheet.dart';
import 'fragment/order_logistics_card.dart';
import 'order_detail_controller.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      builder: (_) {
        return XLoadStateBuilder(
            loadState: _.loadState,
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("订单详情"),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      OrderDetailHeader(),
                      OrderLogisticsCard(),
                      Divider(
                        indent: XDimens.gap32,
                        endIndent: XDimens.gap32,
                      ),
                      OrderActionTipBar(),
                      Divider(
                        indent: XDimens.gap32,
                        endIndent: XDimens.gap32,
                      ),
                      OrderDetailBody(),
                      OrderDetailSheet(),
                      Divider(
                        indent: XDimens.gap32,
                        endIndent: XDimens.gap32,
                      ),
                      OrderDetailFooter(),
                    ],
                  ),
                ),
                bottomNavigationBar: OrderDetailBottomActionBar(),
              );
            });
      },
    );
  }
}
