/*
 * @Description: 商品列表模型
 * @Author: iamsmiling
 * @Date: 2020-12-22 13:47:52
 * @LastEditTime: 2020-12-28 10:11:22
 */
import 'package:taojuwu/app/utils/json_convert_kit.dart';

class OrderModelListWrapper {
  List<OrderModel> orderModelList;

  OrderModelListWrapper.fromJson(Map json) {
    orderModelList = JsonConvertKit.asList(json["data"])
        .map((e) => OrderModel.fromJson(e))
        .toList();
  }
}

class OrderModel {
  int id;
  String no;

  ///[typeCode]1是普通单  2是测量单
  int typeCode;
  int statusCode;
  String receiverName;
  String createTime;

  ///[prepayment]押金
  double prepayment;

  ///[balance]尾款
  double balance;

  ///[estimationAmount]预估价
  double estimationAmount;

  ///[windowCount]窗户数量
  int windowCount;
  int customerId;
  String measureTime;
  String installTime;
  String typeName;

  String customerName;

  List<OrderProductModel> productList;

  OrderModel.fromJson(Map json) {
    id = json['order_id'];
    no = json['order_no'];
    typeCode = json['order_type'];
    statusCode = json['order_status'];
    receiverName = json['receiver_name'];
    createTime = JsonConvertKit.formatDateTime(
        JsonConvertKit.getDateTimeFromMillseconds(json['create_time']));
    prepayment = JsonConvertKit.asDouble(json['order_earnest_money']);
    balance = JsonConvertKit.asDouble(json['tail_money']);
    estimationAmount = JsonConvertKit.asDouble(json['order_estimated_price']);
    windowCount = JsonConvertKit.asInt(json['order_window_num']);
    customerId = json['client_id'];
    measureTime = json['measure_time'];
    installTime = json['install_time'];
    typeName = json['order_type_name'];
    customerName = json['client_name'];
    productList = JsonConvertKit.asList(json["order_item_list"])
        .map((e) => OrderProductModel.fromJsom(e))
        .toList();
  }
}

class OrderProductModel {
  String name;
  double price;

  ///[hasSelected] 是否已经选品
  bool hasSelected;
  int orderStatusCode;
  String statusName;
  String roomName;
  double width;
  double height;
  String image;

  String unit;

  OrderProductModel.fromJsom(Map json) {
    name = json['goods_name'];
    price = JsonConvertKit.asDouble(json['price']);
    hasSelected = JsonConvertKit.asBool(json['is_selected_goods']);
    image = JsonConvertKit.asWebUrl(JsonConvertKit.getValueInComplexMap(
        json, ["picture", "pic_cover_small"]));
  }
}
