/*
 * @Description: 设计类上详情
 * @Author: iamsmiling
 * @Date: 2021-01-10 13:51:14
 * @LastEditTime: 2021-01-10 14:19:19
 */
import 'package:taojuwu/app/domain/model/product/design_product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/utils/json_convert_kit.dart';

class DesignProductDetailModelWrapper {
  DesignProductDetailModel product;
  List<DesignProductModel> list;
  DesignProductDetailModelWrapper.fromJson(Map json) {
    product = DesignProductDetailModel.fromJson(json["scenes_detail"]);
    list = JsonConvertKit.asList(json["related_scenes"])
        .map((e) => DesignProductModel.fromJson(e))
        .cast<DesignProductModel>()
        .toList();
  }
}

class DesignProductDetailModel {
  int id;
  String name;
  String description;

  String room;
  String style;
  String image;
  String bigImage;

  List<ProductModel> productList;

  DesignProductDetailModel.fromJson(Map json) {
    id = json["scenes_id"];
    name = json["scenes_name"];
    description = json["scenes_detail"];
    room = json["space"];
    style = json["style"];
    image = JsonConvertKit.asWebUrl(json["image"]);
    bigImage = JsonConvertKit.asWebUrl(json["image_big"]);
    productList = JsonConvertKit.asList(json["goods_list"])
        .map((e) => ProductModel.fromJson(e))
        .cast<ProductModel>()
        .toList();
  }
}
