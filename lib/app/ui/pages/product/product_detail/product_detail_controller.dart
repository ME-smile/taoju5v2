/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:43:22
 * @LastEditTime: 2020-12-31 09:26:56
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_adapter_model.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/storage/taojuwu_storage.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/fabric_curtain_product_attrs_selector/fabirc_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_pridce_delegator.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';
import 'package:taojuwu/app/utils/x_logger.dart';

import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';

class ProductDetailController extends GetxController {
  final int id;
  ProductDetailController(this.id)
      : tag = "$id",
        selectorController = FabricCurtainProductAttrSelectorController();
  ProductRepository _repository = ProductRepository();

  ProductDetailModelWrapper wrapper;

  ProductDetailModel detailModel;

  XLoadState loadState = XLoadState.idle;

  BaseCurtainProductAttrsSelectorController selectorController;

  BasePoductPriceDelegator priceDelegator;

  ScrollController scrollController;

  ///[tag]
  String tag;

  Future _loadData() {
    loadState = XLoadState.busy;
    return _repository.productDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      loadState = XLoadState.idle;
      this.wrapper = wrapper;
      detailModel = wrapper.detailModel;
      scrollController = ScrollController();
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    _loadData();

    XLogger.e(TaojuwuStorageAccessor().shopCurtainProductAttrs);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  ///模型适配转换
  List<ProductAdapterModel> adapt() {
    Map json = {
      "id": detailModel.id,
      "name": detailModel.name,
      "room": selectorController.room.currentOptionName,
      "price": detailModel.price,
      "attrList": selectorController.attrList,
      "description": "",
      "totalPrice": priceDelegator.totalPrice
    };
    return [ProductAdapterModel.fromJson(json)];
  }
}
