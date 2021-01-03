/*
 * @Description: 商品列表数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:39:17
 * @LastEditTime: 2020-12-30 17:24:20
 */

import 'package:taojuwu/app/utils/json_convert_kit.dart';

import 'product_type.dart';

class ProductModelListWrapper {
  List<ProductModel> list;
  int totalCount;

  ProductModelListWrapper.fromJson(Map json) {
    totalCount = JsonConvertKit.getValueInComplexMap(
        json, ["goods_list", "total_count"]);
    list = JsonConvertKit.asList(
            JsonConvertKit.getValueInComplexMap(json, ["goods_list", "data"]))
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

  int code;
  ProductModel.fromJson(Map json) {
    id = json['goods_id'];
    name = json['goods_name'];
    image = (json['pic_cover_mid'] ?? json['image']);
    code = json["goods_type"];
    marketPrice = JsonConvertKit.asDouble(json['market_price']);
    unit = json["unit"];
    price = JsonConvertKit.asDouble(
        (json['price'] ?? json['display_price'] ?? json['market_price']));
  }
}

extension ProductModelKit on ProductModel {
  BaseProductType get productType => getProductType(code);
}
