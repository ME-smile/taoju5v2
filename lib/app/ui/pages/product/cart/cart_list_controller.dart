/*
 * @Description: 购物车
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:29:31
 * @LastEditTime: 2021-01-07 10:11:51
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/cart_product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_adapter_model.dart';
import 'package:taojuwu/app/domain/model/product/product_tab_model.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class CartListParentController extends GetxController
    with SingleGetTickerProviderMixin {
  List<ProductTabModel> tabList = [
    ProductTabModel(name: "窗帘", id: 0),
    ProductTabModel(name: "床品", id: 1),
    ProductTabModel(name: "抱枕", id: 2),
    ProductTabModel(name: "沙发", id: 3),
    ProductTabModel(name: "搭毯", id: 4),
  ];

  TabController tabController;
  CartListParentController();

  String get tag => tabList[tabController?.index ?? 0].name;
  CartListController get cartListController =>
      Get.find<CartListController>(tag: tag);
  List<CartPorductModel> get cartList => cartListController.cartList;
  // get totalPrice => cartList.totalPrice.obs;
  bool get isCheckedAll => cartListController.isCheckedAll;

  set isCheckedAll(bool flag) {
    CartListController cartListController =
        Get.find<CartListController>(tag: tag);
    cartListController.cartList.forEach((e) {
      e.isChecked.value = flag;
    });
    // cartListController.isCheckedAll = flag;
  }

  void tabChangeListener() {
    update(["action"]);
  }

  @override
  void onInit() {
    tabController = TabController(
      length: tabList.length,
      vsync: this,
    )..addListener(tabChangeListener);
    super.onInit();
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }
}

class CartListController extends GetxController {
  ProductRepository _repository = ProductRepository();

  int get clientId => Get.find<CustomerProviderController>().id;

  List<CartPorductModel> cartList = [];

  List<CartPorductModel> get checkedCartList {
    if (GetUtils.isNullOrBlank(cartList)) return [];
    return cartList?.where((e) => e.isChecked.value)?.toList();
  }

  List<ProductAdapterModel> get orderProductList =>
      checkedCartList.map((e) => e.adapt()).toList();

  double get totalPrice {
    if (GetUtils.isNullOrBlank(checkedCartList)) return 0;
    return checkedCartList.map((e) => e.totalPrice)?.reduce((a, b) => a + b);
  }

  set isCheckedAll(bool flag) {
    for (CartPorductModel e in cartList) {
      e.isChecked.value = flag;
    }
  }

  bool get isCheckedAll {
    if (GetUtils.isNullOrBlank(cartList)) return false;

    ///任意一个[checked]属性为[false]则不是全选
    return !cartList.any((e) => e.isChecked.value == false);
  }

  XLoadState loadState = XLoadState.idle;
  Future _loadData() {
    loadState = XLoadState.busy;
    return _repository.cartList(params: {"client_uid": clientId}).then(
        (CartPorductModelListWrapper value) {
      loadState = XLoadState.idle;
      cartList = value.list;
    }).catchError((err) {
      loadState = XLoadState.error;
      throw err;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
