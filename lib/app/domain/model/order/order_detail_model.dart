/*
 * @Description: 订单详情数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:26:35
 * @LastEditTime: 2021-01-15 13:49:18
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/model/order/order_type.dart';
import 'package:taojuwu/app/domain/model/order/refund_status.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/utils/json_kit.dart';

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
  int refundStatusCode;
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

  String deposit;
  String balance;
  String payAmount;
  String originalPrice;

  String deltaPrice;
  String modifyPriceNote;

  OrderDetailModel.fromJson(Map json) {
    id = json['order_id'];
    no = json['order_no'];
    title = json["order_title"];
    description = json["order_desc"];
    typeCode = json['order_type'];
    orderStatusCode = json['order_status'];
    refundStatusCode = json["refund_status"];
    receiverAddress = json['address'];
    receiverTel = json['receiver_mobile'];
    receiverName = json['receiver_name'];
    deposit = json['order_earnest_money'];
    installTime = json["install_time"];
    measureTime = json["measure_time"];
    username = json["user_name"];
    customerName = json["client_name"];
    deltaPrice = json["adjust_money"];
    originalPrice = json["order_estimated_price"];
    modifyPriceNote = json["adjust_money_remark"];
    shopName = json["shop_name"];
    balance = json["tail_money"];
    payAmount = json["reality_pay_money"];

    createTime = JsonKit.formatDateTime(
        JsonKit.getDateTimeFromMillseconds(json["create_time"]));
    actualInstallTime = JsonKit.formatDateTime(
        JsonKit.getDateTimeFromMillseconds(json["reality_install_time"]));
    actualMeasureTime = JsonKit.formatDateTime(
        JsonKit.getDateTimeFromMillseconds(json["reality_measure_time"]));

    productList = JsonKit.asList(json["order_goods"])
        .map((e) => OrderDetailProductModel.fromJson(e))
        .cast<OrderDetailProductModel>()
        .toList();
  }
}

extension OrderDetailModelKit on OrderDetailModel {
  OrderStatus get orderStatus => getOrderStaus(orderStatusCode);
  OrderType get orderType => getOrderType(typeCode, orderStatus);
  BaseProductType get productType => getProductType(productTypeCode);

  RefundStatus get refundStatus {
    if (productList.any((e) => e.refundStatus == RefundStatus.refundable))
      return RefundStatus.refundable;
    return RefundStatus.toBeAuthed;
  }

  bool get canRefund => refundStatus == RefundStatus.refundable;

  set refundStatus(RefundStatus status) {
    Map<RefundStatus, int> map = {
      RefundStatus.refundable: 0,
      RefundStatus.toBeAuthed: 1
    };
    productList.forEach((e) {
      e.refundStatusCode = map[status];
    });
  }

  bool get canCancel =>
      orderStatus != OrderStatus.canceled &&
      orderStatus < OrderStatus.producing;

  bool get isPriceModified => !GetUtils.isNullOrBlank(deltaPrice);

  bool get isAllProductCanceled => GetUtils.isNullOrBlank(productList)
      ? true
      : productList.any((e) => e.refundStatus != RefundStatus.refundable);
}
