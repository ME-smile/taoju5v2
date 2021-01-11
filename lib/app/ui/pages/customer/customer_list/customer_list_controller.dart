/*
 * @Description:客户列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:09:30
 * @LastEditTime: 2021-01-09 21:12:44
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_category_model.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class CustomerListController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  List<CustomerCategoryModel> categoryList = [
    CustomerCategoryModel(
        count: 0, name: "初谈客户", icon: "init_customer.png", type: 0),
    CustomerCategoryModel(
        count: 0, name: "意向客户", icon: "potential_customer.png", type: 0),
    CustomerCategoryModel(
        count: 0, name: "跟进客户", icon: "following_customer.png", type: 0),
    CustomerCategoryModel(
        count: 0, name: "成交客户", icon: "finished_customer.png", type: 0),
  ];

  ScrollController scrollController;

  ///更新数量
  void updateCount(List<int> list) {
    for (int i = 0; i < list.length; i++) {
      categoryList[i].count = list[i];
    }
  }

  List<CustomerModel> customerList;

  XLoadState loadState = XLoadState.idle;
  Future<CustomerModelListWrapper> loadData() {
    loadState = XLoadState.busy;

    return _repository.customerList().then((CustomerModelListWrapper value) {
      customerList = value.list;
      updateCount(value.countList);
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }
}
