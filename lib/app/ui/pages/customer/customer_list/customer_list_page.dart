/*
 * @Description: 客户列表页
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:18:59
 * @LastEditTime: 2020-12-29 13:53:40
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/utils/x_logger.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({Key key}) : super(key: key);

  ///[ifChooseCustomer]是否为选择客户
  bool get ifChooseCustomer => Get.previousRoute == AppRoutes.customerEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("客户列表页面"),
      ),
      body: GetBuilder<CustomerListController>(
        builder: (_) {
          return XLoadStateBuilder(
            builder: (BuildContext context) {
              List<CustomerModel> list = _.wrapper.list;
              return ListView.builder(
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      ///如果是从用户编辑页面过来
                      if (ifChooseCustomer) {
                        XLogger.v("选择客户时间");
                        Get.find<CustomerProviderController>().customer =
                            list[i];
                        Get..back()..back();
                      } else {
                        Get.toNamed(AppRoutes.customerDetail + "/${list[i].id}")
                            .then((value) {
                          ///[value is CustomerDetailModel]进入详情页修改后 则更新姓名
                          if (value is CustomerDetailModel) {
                            for (CustomerModel e in list) {
                              if (e.id == value.id) {
                                e.name = value.name;
                                _.update();
                                return;
                              }
                            }
                          }
                        });
                      }
                    },
                    child: Text("${list[i].name}"),
                  );
                },
                itemCount: list.length,
              );
            },
            loadState: _.loadState,
          );
        },
      ),
    );
  }
}
