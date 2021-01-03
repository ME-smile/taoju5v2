/*
 * @Description:商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-31 14:25:23
 * @LastEditTime: 2020-12-31 18:03:42
 */

import 'package:taojuwu/app/utils/json_convert_kit.dart';

class ProductAttrModel {
  int type;
  String key;
  String value;
  double totalPrice;

  ProductAttrModel.fromJson(Map json) {
    type = json["type"];
    key = json["attr_category"];
    value = json["attr_name"];
    totalPrice = JsonConvertKit.asDouble(json["sub_total"]);
  }
}
