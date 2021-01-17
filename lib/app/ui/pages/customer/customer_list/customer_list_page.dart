/*
 * @Description: 客户列表页
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:18:59
 * @LastEditTime: 2021-01-16 19:39:54
 */

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/domain/model/customer/customer_category_model.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taojuwu/app/ui/pages/search/search_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerListController>(
      builder: (_) {
        return XLoadStateBuilder(
          builder: (BuildContext context) {
            List<CustomerModel> list = _.customerList;
            return NestedScrollView(
                controller: _.scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        title: Text("客户列表页面"),
                        elevation: .5,
                        floating: true,
                        pinned: false,
                        actions: [
                          IconButton(
                              icon: Icon(XIcons.search),
                              onPressed: () => Get.toNamed(AppRoutes.search,
                                  arguments: SearchType.customer)),
                          IconButton(
                              icon: Image.asset(AppConfig.assetImagePrefixPath +
                                  "customer_add.png"),
                              onPressed: () =>
                                  Get.toNamed(AppRoutes.customerEdit + "/0"))
                        ],
                        expandedHeight: 276,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            margin: EdgeInsets.only(top: 96),
                            child: Column(
                              children: [
                                for (CustomerCategoryModel e in _.categoryList)
                                  Column(
                                    children: [
                                      Container(
                                        color: XColors.primaryColor,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: XDimens.gap32,
                                            vertical: XDimens.gap24),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                AppConfig.assetImagePrefixPath +
                                                    e.icon),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: XDimens.gap24),
                                              child: Text(e.name),
                                            ),
                                            Text("(${e.count})"),
                                            Spacer(),
                                            Icon(XIcons.next)
                                          ],
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  )
                              ],
                            ),
                          ),
                        ))
                  ];
                },
                body: Scrollbar(
                  controller: _.scrollController,
                  child: AzListView(
                      data: list,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      indexBarData: list.map((e) => e.tag).toSet().toList(),
                      susItemBuilder: (BuildContext context, int i) {
                        String tag = list[i].tag;
                        String lastTag = i == 0 ? "#" : list[i - 1].tag;
                        return Visibility(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: XDimens.gap32,
                                vertical: XDimens.gap4),
                            child: Text(
                              "${list[i].tag}",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          visible: i == 0 ? true : tag != lastTag,
                        );
                      },
                      itemBuilder: (BuildContext context, int i) {
                        return GestureDetector(
                          onTap: () {
                            if (!(Get.arguments ?? false)) {
                              Get.toNamed(
                                  AppRoutes.customerDetail + "/${list[i].id}");
                              return;
                            }
                            Get.find<CustomerProviderController>().customer =
                                list[i];
                            return Get.until((route) => Get.currentRoute
                                .contains(
                                    (Get.isRegistered<CommitOrderController>()
                                        ? AppRoutes.commitOrder
                                        : AppRoutes.productDetail)));
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            color: XColors.primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: XDimens.gap32,
                                vertical: XDimens.gap16),
                            child: Text("${list[i].name}"),
                          ),
                        );
                      }),
                ));
          },
          loadState: _.loadState,
        );
      },
    );
  }
}
