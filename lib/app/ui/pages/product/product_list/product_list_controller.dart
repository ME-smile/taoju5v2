/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:35:04
 * @LastEditTime: 2021-01-15 22:33:21
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_sort_model.dart';
import 'package:taojuwu/app/domain/model/product/product_tab_model.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_sorter/product_list_sorter_panel.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';
import 'package:taojuwu/app/ui/widgets/common/modal/x_popdown_modal.dart';

class ProductListParentController extends GetxController
    with SingleGetTickerProviderMixin {
  List<ProductTabModel> tabList = [
    ProductTabModel(name: "窗帘", id: 0),
    ProductTabModel(name: "床品", id: 1),
    ProductTabModel(name: "抱枕", id: 2),
    ProductTabModel(name: "沙发", id: 3),
    ProductTabModel(name: "搭毯", id: 4),
  ];
  List<ProductSortModel> sortList = [
    ProductSortModel(id: 1, name: "默认排序", isChecked: true),
    ProductSortModel(id: 2, name: "新品优先", order: "is_new", sort: "desc"),
    ProductSortModel(id: 3, name: "销量排序", order: "sales", sort: "desc"),
    ProductSortModel(id: 4, name: "价格升序", order: "price", sort: "asc"),
    ProductSortModel(id: 5, name: "价格降序", order: "price", sort: "desc"),
  ];

  String get sortName => sortList.firstWhere((e) => e.isChecked).name;

  ///是否为网格视图
  bool isGridMode = true;

  TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabList.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  void triggerSortAction(ProductSortModel model) {
    for (ProductSortModel e in sortList) {
      e.isChecked = e == model;
    }
    update(["sort"]);
    Get.back();
    productListController.refreshData(params: model.params);
  }

  Future sort(BuildContext ctx) {
    ///判断是否已经打开了排序面板,如果已经打开,则关闭
    if (!ModalRoute.of(ctx).isCurrent) {
      Get.back();
      return Future.value(false);
    }

    ///判断是否已经打开筛选面板,如果已经打开则关闭
    if (scaffoldKey.currentState.isEndDrawerOpen) {
      Get.back();
    }

    ///打开排序面板
    RenderBox renderBox = ctx.findRenderObject();
    Rect box = renderBox.localToGlobal(Offset.zero) & renderBox.size;
    return showXModalPopdown(ctx,
            builder: (BuildContext context) => ProductListSorterPanel(),
            offset: box.bottom)
        .then((value) {
      // refreshData();
    });
  }

  String get tag => tabList[tabController?.index ?? 0]?.name;

  ProductListController get productListController =>
      Get.find<ProductListController>(tag: tag);
  GlobalKey<ScaffoldState> get scaffoldKey => productListController.scaffoldKey;
  void filter(BuildContext context) {
    ///如果已经打开了排序面版 则关闭排序面板
    if (!ModalRoute.of(context).isCurrent) {
      Get.back();
    }
    //如果已经打开了筛选面板
    if (scaffoldKey.currentState.isEndDrawerOpen) {
      Get.back();
    } else {
      scaffoldKey.currentState.openEndDrawer();
    }
  }
}

class ProductListController extends GetxController {
  ProductRepository _repository = ProductRepository();

  List<ProductModel> productList = [];
  //[_scaffoldKey]控制右侧筛选面板的打开与关闭
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  XLoadState loadState = XLoadState.idle;

  RefreshController refreshController;

  final Map initialParams;

  ProductListController(this.initialParams);

  Future load({Map params}) {
    loadState = XLoadState.busy;
    return _repository
        .productList(params: initialParams)
        .then((ProductModelListWrapper wrapper) {
      loadState = XLoadState.idle;
      productList = wrapper.list;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future refreshData({Map params}) {
    initialParams.addAll(params ?? {});
    loadState = XLoadState.busy;
    update();

    return _repository
        .productList(params: initialParams)
        .then((ProductModelListWrapper wrapper) {
      refreshController.refreshCompleted();
      loadState = XLoadState.idle;
      productList = wrapper.list;
    }).catchError((err) {
      refreshController.refreshFailed();
    }).whenComplete(update);
  }

  @override
  void onInit() {
    load();
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    super.onClose();
  }
}
