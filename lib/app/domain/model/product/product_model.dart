/*
 * @Description: 商品列表数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:39:17
 * @LastEditTime: 2021-01-09 19:10:11
 */

import 'package:taojuwu/app/utils/json_kit.dart';

import 'product_type.dart';

class ProductModelListWrapper {
  List<ProductModel> list;
  int totalCount;

  ProductModelListWrapper.fromJson(Map json) {
    totalCount =
        JsonKit.getValueInComplexMap(json, ["goods_list", "total_count"]);
    list = JsonKit.asList(
            JsonKit.getValueInComplexMap(json, ["goods_list", "data"]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}

///[ProductModel]商品列表页 商品数据模型
class ProductModel {
  int id;
  String name;
  String image;
  double marketPrice;
  double price;
  String unit;
  int picId;

  int code;
  ProductModel.fromJson(Map json) {
    id = json['goods_id'];
    name = json['goods_name'];
    image = (json['pic_cover_mid'] ?? json['image']);
    code = json["goods_type"];
    marketPrice = JsonKit.asDouble(json['market_price']);
    unit = json["unit"];
    picId = json["pic_id"];
    price = JsonKit.asDouble(
        (json['price'] ?? json['display_price'] ?? json['market_price']));
  }
}

extension ProductModelKit on ProductModel {
  BaseProductType get productType => getProductType(code);
}
