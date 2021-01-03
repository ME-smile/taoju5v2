/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:35:04
 * @LastEditTime: 2020-12-28 09:39:08
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_sort_model.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_sorter/product_list_sorter_panel.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';
import 'package:taojuwu/app/ui/widgets/common/modal/x_popdown_modal.dart';

class ProductListController extends GetxController {
  //[_scaffoldKey]控制右侧筛选面板的打开与关闭
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ProductRepository _repository = ProductRepository();

  List<ProductModel> productList = [];

  ///商品排序模型
  ProductSortModel sortModel =
      ProductSortModel(id: 1, name: "默认排序", isChecked: true);

  ///是否为网格视图
  bool isGridMode = true;

  XLoadState loadState = XLoadState.idle;

  Future load({Map params}) {
    loadState = XLoadState.busy;
    return _repository
        .productList(params: params)
        .then((ProductModelListWrapper wrapper) {
      loadState = XLoadState.idle;
      productList = wrapper.list;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    load();
    super.onInit();
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
        offset: box.bottom);
  }

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
