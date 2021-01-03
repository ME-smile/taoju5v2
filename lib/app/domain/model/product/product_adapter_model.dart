/*
 * @Description: 预提交订单的商品
 * @Author: iamsmiling
 * @Date: 2020-12-30 17:17:51
 * @LastEditTime: 2020-12-31 08:52:56
 */

import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';

class ProductAdapterModel {
  int id;
  String room;
  String name;
  double unitPrcie;
  String description;
  String unit;
  double totalPrice;
  List<CurtainProductAttrModel> attrList;
  String image;

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
