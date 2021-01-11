/*
 * @Description: 预提交订单的商品
 * @Author: iamsmiling
 * @Date: 2020-12-30 17:17:51
 * @LastEditTime: 2021-01-04 13:27:19
 */

import 'product_attr_model.dart';

class ProductAdapterModel {
  int id;
  String room;
  String name;
  double unitPrcie;
  String description;
  String unit;
  double totalPrice;
  List<ProductAttrAdapterModel> attrList;
  String image;
  ProductAdapterModel();
  ProductAdapterModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    room = json["room"];
    unitPrcie = json["price"];
    description = json["description"];
    attrList = json["attrList"];
    image = json["image"];
    totalPrice = json["totalPrice"];
  }
}
