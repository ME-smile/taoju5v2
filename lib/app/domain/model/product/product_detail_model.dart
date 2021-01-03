/*
 * @Description: 商品详情数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:44:38
 * @LastEditTime: 2020-12-25 14:11:47
 */

import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/utils/json_convert_kit.dart';

class ProductDetailModelWrapper {
  ProductDetailModel detailModel;
  List<ProductModel> associatedProductList;
  List<ProductModel> recommendedProductList;

  ProductDetailModelWrapper.fromJson(Map json) {
    detailModel = ProductDetailModel.fromJson(json['goods_detail']);
    associatedProductList = JsonConvertKit.asList(json["related_goods"])
        .map((e) => ProductModel.fromJson(e))
        .toList();
    recommendedProductList = JsonConvertKit.asList(json["referrals_goods"])
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}

class ProductDetailModel {
  int id;
  String name;
  int shopId;
  int isCollect;

  //0  成品  1 布艺帘  2卷帘
  int type;
  double marketPrice;
  double price;
  List<String> imgList;
  String skuName;
  int defalutSkuId;
  String picture;
  int picId;
  int count = 1;
  String cover;
  List<String> detailImgList;
  bool isChecked = true;
  num width;
  num height;

  bool isFixedHeight; // 窗帘是否定高
  bool isFixedWidth; //窗帘是否定宽
  bool isCustomSize; //自定义宽高

  double doorWidth; //门幅
  double flowerSize; //花距
  bool hasFlower; // 窗帘是否有拼花

  List<ProductMaterialInfoModel> infoModelList;
  ProductDetailModel.fromJson(Map json) {
    id = json['goods_id'];
    name = json['goods_name'];
    shopId = json['shop_id'];
    isCollect = json['is_collect'];
    type = json['goods_type'];
    picId = json['pic_id'];
    marketPrice = JsonConvertKit.asDouble(json['market_price']);
    price = JsonConvertKit.asDouble(json['price']);
    imgList = JsonConvertKit.asList(json['goods_img_list'])
        .map((e) => JsonConvertKit.getValueByKey(e, 'pic_cover_big').toString())
        .toList();
    cover = json['image'] ??
        JsonConvertKit.getValueByKey(json['picture_info'], 'pic_cover_big');
    infoModelList = JsonConvertKit.asList(json['goods_attribute_list'])
        .map((e) => ProductMaterialInfoModel.fromJson(e))
        ?.toList();
    skuName = json['sku_name'];
    detailImgList = json["new_description"]?.cast<String>();
    isFixedHeight = json['fixed_height'] == 1;
    isFixedWidth = json['fixed_height'] == 2;
    isCustomSize = json['fixed_height'] == 3;

    ///后台数据以cm为单位,在这里进行单位转换
    doorWidth = (JsonConvertKit.asDouble(json['larghezza_size']) / 100);
    flowerSize = (JsonConvertKit.asDouble(json['flower_distance']) / 100);

    hasFlower = json['is_flower'] == 1;
  }
}

///商品材料成分信息
class ProductMaterialInfoModel {
  int id;
  String key;
  String value;
  ProductMaterialInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['attr_value_id'];
    key = json['attr_value'];
    value = json['attr_value_name'];
  }
}
