/*
 * @Description: 软装方案,场景推荐 设计类商品数据模型
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:05:08
 * @LastEditTime: 2021-01-12 15:08:41
 */

import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/utils/json_kit.dart';

class DesignProductModel {
  int id;
  String name;
  String image;
  double price;
  String tag;
  String room;
  String style;
  List<ProductModel> productlist;

  DesignProductModel.fromJson(Map json) {
    id = json["scenes_id"];
    name = json["scenes_name"];
    tag = json["name"];
    image = JsonKit.asWebUrl(json["image"]);
    productlist = JsonKit.asList(json["goods_list"])
        .map((e) => ProductModel.fromJson(e))
        .cast<ProductModel>()
        .toList();
  }
}

extension DesignProductModelKit on DesignProductModel {
  double get totalPrice =>
      productlist.map((e) => e.price).reduce((a, b) => a + b);
}
