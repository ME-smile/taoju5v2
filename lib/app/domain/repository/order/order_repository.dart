/*
 * @Description: 订单相关api
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:04:37
 * @LastEditTime: 2020-12-22 14:34:33
 */

import 'package:taojuwu/app/domain/model/order/order_detail_model.dart';
import 'package:taojuwu/app/domain/model/order/order_model.dart';
import 'package:taojuwu/app/domain/provider/order/order_api.dart';
import 'package:taojuwu/app/xdio/x_dio.dart';

class OrderRepository {
  OrderAPI _api = OrderAPI();

  Future<OrderModelListWrapper> orderList({Map params}) {
    return _api
        .orderList("/api/order/order", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return OrderModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<OrderDetailModelWrapper> orderDetail({Map params}) {
    return _api
        .orderList("  /api/order/orderDetail", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return OrderDetailModelWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }
}
