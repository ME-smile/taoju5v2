/*
 * @Description: 订单详情数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:26:35
 * @LastEditTime: 2021-01-10 21:00:15
 */

import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/model/order/order_type.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/utils/json_convert_kit.dart';

import 'order_detail_product_model.dart';

class OrderDetailModelWrapper {
  OrderDetailModel orderDetailModel;
  OrderDetailModelWrapper.fromJson(Map json) {
    orderDetailModel = OrderDetailModel.fromJson(json['order']);
  }
}

class OrderDetailModel {
  int id;
  String no;
  int typeCode;
  int orderStatusCode;
  int productTypeCode;
  String title;
  String description;
  String receiverName;
  String receiverAddress;
  String receiverTel;

  String measureTime;
  String actualMeasureTime;
  String installTime;
  String actualInstallTime;

  List<OrderDetailProductModel> productList;

  String note;

  String createTime;
  String username;
  String customerName;
  String shopName;

  OrderDetailModel.fromJson(Map json) {
    id = json['order_id'];
    no = json['order_no'];
    title = json["order_title"];
    description = json["order_desc"];
    typeCode = json['order_type'];
    orderStatusCode = json['order_status'];
    receiverAddress = json['address'];
    receiverTel = json['receiver_mobile'];
    receiverName = json['receiver_name'];

    installTime = json["install_time"];
    measureTime = json["measure_time"];
    username = json["user_name"];
    shopName = json["shop_name"];
    createTime = JsonConvertKit.formatDateTime(
        JsonConvertKit.getDateTimeFromMillseconds(json["create_time"]));
    actualInstallTime = JsonConvertKit.formatDateTime(
        JsonConvertKit.getDateTimeFromMillseconds(
            json["reality_install_time"]));
    actualMeasureTime = JsonConvertKit.formatDateTime(
        JsonConvertKit.getDateTimeFromMillseconds(
            json["reality_measure_time"]));

    productList = JsonConvertKit.asList(json["order_goods"])
        .map((e) => OrderDetailProductModel.fromJson(e))
        .cast<OrderDetailProductModel>()
        .toList();
  }
}

extension OrderDetailModelKit on OrderDetailModel {
  OrderStatus get orderStatus => getOrderStaus(orderStatusCode);
  OrderType get orderType => getOrderType(typeCode, orderStatus);
  BaseProductType get productType => getProductType(productTypeCode);

  bool get canCancel =>
      orderStatus != OrderStatus.canceled &&
      orderStatus < OrderStatus.producing;
}
