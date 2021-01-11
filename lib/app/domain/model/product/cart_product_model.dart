/*
 * @Description: 购物车商品模型
 * @Author: iamsmiling
 * @Date: 2020-12-29 17:49:18
 * @LastEditTime: 2021-01-04 14:57:47
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_attr_model.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/interface/i_xcountalbe.dart';
import 'package:taojuwu/app/utils/json_convert_kit.dart';

import 'product_adapter_model.dart';

class CartPorductModelListWrapper {
  List<CartPorductModel> list;

  CartPorductModelListWrapper.fromJson(Map json) {
    list = JsonConvertKit.asList(json["cart_list"])
        .map((e) => CartPorductModel.fromJson(e))
        .toList();
  }
}

class CartPorductModel implements IXCountable {
  int id;
  int skuId;
  String productName;
  double productPrice;
  String description;
  double estimatedPrice;

  int productId;
  int type;
  String image;
  String room;
  List<ProductAttrAdapterModel> attrsList;

  final isChecked = false.obs;
  RxInt count;
  CartPorductModel.fromJson(Map json) {
    id = json["cart_id"];

    count = RxInt((json["num"] ?? 1));
    productName = json['goods_name'];
    skuId = JsonConvertKit.asInt(json["sku_id"]);
    description = json["goods_attr_str"];
    room = JsonConvertKit.getValueInComplexMap(json, ["wc_attr", "1", "name"]);
    image = JsonConvertKit.asWebUrl(JsonConvertKit.getValueInComplexMap(
        json, ["picture_info", "pic_cover"]));
    type = json["goods_type"];
    productId = json["goods_id"];
    estimatedPrice =
        JsonConvertKit.asDouble(json["estimated_price"]) * count.value;
    attrsList = JsonConvertKit.asList(json["goods_accessory"])
        .map((e) => ProductAttrAdapterModel.fromJson(e))
        .toList();
  }
}

extension CartPorductModelKit on CartPorductModel {
  ///商品类型
  BaseProductType get productType => getProductType(type);
  double get totalPrice => estimatedPrice * count.value;
  ProductAdapterModel adapt() {
    ProductAdapterModel model = ProductAdapterModel();
    model.id = productId;
    model.room = room;
    model.attrList = attrsList;
    model.name = productName;
    model.unitPrcie = productPrice;
    model.totalPrice = totalPrice;
    model.image = image;
    return model;
  }
}
