/*
 * @Description: 购物车商品模型
 * @Author: iamsmiling
 * @Date: 2020-12-29 17:49:18
 * @LastEditTime: 2020-12-31 18:04:20
 */
import 'package:taojuwu/app/domain/model/product/product_attr_model.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/utils/json_convert_kit.dart';

class CartPorductModelListWrapper {
  List<CartPorductModel> list;

  CartPorductModelListWrapper.fromJson(Map json) {
    list = JsonConvertKit.asList(json["cart_list"])
        .map((e) => CartPorductModel.fromJson(e))
        .toList();
  }
}

class CartPorductModel {
  int id;
  int skuId;
  bool isChecked = false;
  String productName;
  double productPrice;
  String description;
  double totalPrice;
  int productId;
  int type;
  List<ProductAttrModel> attrs;
  CartPorductModel.fromJson(Map json) {
    id = json["cart_id"];
    productName = json['goods_name'];
    skuId = JsonConvertKit.asInt(json["sku_id"]);
    description = json["goods_attr_str"];
    type = json["goods_type"];
    productId = json["goods_id"];
    totalPrice = JsonConvertKit.asDouble(json["estimated_price"]);
    attrs = JsonConvertKit.asList(json["goods_accessory"])
        .map((e) => ProductAttrModel.fromJson(e))
        .toList();
  }
}

extension CartPorductModelKit on CartPorductModel {
  ///商品类型
  BaseProductType get productType => getProductType(type);
}
