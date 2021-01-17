/*
 * @Description: 订单相关api
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:04:37
 * @LastEditTime: 2021-01-16 16:23:17
 */

import 'package:taojuwu/app/domain/model/order/order_detail_model.dart';
import 'package:taojuwu/app/domain/model/order/order_model.dart';
import 'package:taojuwu/app/domain/model/order/order_price_model.dart';
import 'package:taojuwu/app/domain/provider/order/order_api.dart';
import 'package:taojuwu/app/utils/x_logger.dart';
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
        .orderDetail("/api/order/orderDetail", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return OrderDetailModelWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  ///选品
  Future selectProduct({Map params}) {
    return _api
        .selectProduct("/api/order/addMeasureOrderGoods", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return;
      }
      // throw EasyLoading.showInfo(response.message);/
    }).catchError((err) {
      throw err;
    });
  }

  ///确认选品
  Future confirmSelect({Map params}) {
    return _api
        .selectProduct("/api/order/addMeasureOrderGoods", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return;
      }
      // throw EasyLoading.showInfo(response.message);/
    }).catchError((err) {
      throw err;
    });
  }

  ///订单提醒
  Future remind({Map params}) {
    XLogger.v(params);
    return _api
        .remind("/api/order/notice", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return;
      }
      // throw EasyLoading.showInfo(response.message);/
    }).catchError((err) {
      throw err;
    });
  }

  /// [adjust_money]: deltaPrice,
  /// [adjust_money_remark] 'adjust_money_remark': remark,
  ///  [order_id]  'order_id': orderId ?? -1
  Future<OrderPriceModel> modifyPrice({Map params}) {
    XLogger.v(params);
    return _api
        .modifyPrice("/api/order/orderAdjustMoney", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return OrderPriceModel.fromJson(response.data);
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  /// [order_id]: orderId,
  /// [order_close_reason]: reason
  Future<BaseResponse> cancelOrder({Map params}) {
    XLogger.v(params);
    return _api
        .cancelOrder("/api/order/orderClose", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return response;
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  Future<BaseResponse> cancelProduct({Map params}) {
    XLogger.v(params);
    return _api
        .cancelProduct("/api/order/orderRefund", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return response;
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  Future submitOrder({Map params, bool isMeasureOrder = false}) {
    return _api
        .submitOrder(
            isMeasureOrder
                ? "/api/order/orderMeasureCreate"
                : "/api/order/orderCreate",
            params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return response;
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }
}
