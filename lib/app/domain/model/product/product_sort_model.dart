/*
 * @Description: 商品排序模型
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:17:11
 * @LastEditTime: 2020-12-25 15:45:39
 */

import 'package:flutter/foundation.dart';

class ProductSortModel {
  String name;
  bool isChecked;
  String sort;
  String order;
  int id;
  ProductSortModel(
      {@required this.name,
      @required this.id,
      this.sort = "",
      this.order = "",
      this.isChecked = false});
  Map toJson() => {"sort": sort, "order": order};
}
