/*
 * @Description: 订单详情商品
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:51:04
 * @LastEditTime: 2021-01-06 17:55:52
 */
import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/model/order/order_type.dart';
import 'package:taojuwu/app/domain/model/order/refund_status.dart';
import 'package:taojuwu/app/utils/json_convert_kit.dart';

class OrderDetailProductModel {
  int id;
  int orderId;
  int prodcutId;
  String name;
  String image;
  String description;
  String price;
  String totalPrice;
  String orderStatusName;
  int typeCode;
  int orderStatusCode;

  int refundStatusCode;

  bool hasSelected;

  OrderDetailProductModel.fromJson(Map json) {
    id = json["order_goods_id"];
    orderId = json["order_id"];
    name = json["goods_name"];
    prodcutId = json["goods_id"];
    price = json["price"];
    typeCode = json["order_type"];
    orderStatusCode = json["order_status"];
    refundStatusCode = json["refund_status"];
    image = JsonConvertKit.asWebUrl(JsonConvertKit.getValueInComplexMap(
        json, ["picture_info", "pic_cover"]));
    description = json["goods_attr_str"];
    totalPrice = json["estimated_price"];
    hasSelected = JsonConvertKit.asBool(json["is_selected_goods"]);
    orderStatusName = json["status_name"];
  }
}

extension OrderDetailProductModelKit on OrderDetailProductModel {
  OrderStatus get orderStatus => getOrderStaus(orderStatusCode);
  OrderType get orderType => getOrderType(typeCode, orderStatus);
  RefundStatus get refundStatus => getRefundStatus(refundStatusCode);

  bool get canCancel =>

      ///商品不属于已取消状态 并且没有进入生产中状态
      (orderStatus != OrderStatus.canceled &&
          orderStatus < OrderStatus.producing) &&
      //如果已经拒绝取消,则可以重新发起取消
      ((refundStatus == RefundStatus.refundable) ||
          (refundStatus == RefundStatus.failed));
}
