/*
 * @Description: 商品详情控制器v2
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:46:36
 * @LastEditTime: 2021-01-12 15:14:34
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/design_product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_adapter_model.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class ProductDetailControllerV2 extends GetxController {
  ProductRepository _repository = ProductRepository();

  XLoadState loadState = XLoadState.idle;
  final id = Get.parameters["id"];
  ScrollController scrollController;
  ProductDetailModel product;

  ///搭配精选
  List<ProductModel> mixedProductList;

  ///为你推荐
  List<ProductModel> recomendProductList;

  ///场景推荐
  List<DesignProductModel> sceneDesignProductList;

  ///软装方案
  List<DesignProductModel> softDesignProductList;

  Future _loadData() {
    loadState = XLoadState.busy;

    return _repository.productDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      loadState = XLoadState.idle;
      product = wrapper.detailModel;
      mixedProductList = wrapper.mixedProductList;
      sceneDesignProductList = wrapper.sceneDesignProductList;
      softDesignProductList = wrapper.softDesignProductList;
      recomendProductList = wrapper.recommendedProductList;
      scrollController = ScrollController();
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  ///模型适配转换
  List<ProductAdapterModel> adapt() {
    Map json = {
      "id": product.id,
      "name": product.name,
      // "room": product.room.currentOptionName,
      "price": product.price,
      // "attrList": selectorController.attrList,
      "description": "",
      // "totalPrice": product.totalPrice
    };
    return [ProductAdapterModel.fromJson(json)];
  }

  @override
  void onInit() {
    _loadData();

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
