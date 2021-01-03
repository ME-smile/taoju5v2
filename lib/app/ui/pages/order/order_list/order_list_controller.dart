/*
 * @Description: 订单列表控制器
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:24:18
 * @LastEditTime: 2020-12-28 10:13:26
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_model.dart';
import 'package:taojuwu/app/domain/repository/order/order_repository.dart';
import 'package:taojuwu/app/ui/pages/order/order_status.dart';
import 'package:taojuwu/app/ui/pages/order/order_type.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

extension OrderModelKit on OrderModel {
  OrderStatus get orderStatus => getOrderStaus(statusCode);
  OrderType get orderType => getOrderType(typeCode, orderStatus);
}

class OrderListController extends GetxController {
  OrderRepository _repository = OrderRepository();

  OrderModelListWrapper wrapper;

  XLoadState loadState = XLoadState.idle;
  Future<OrderModelListWrapper> loadData({Map params}) {
    loadState = XLoadState.busy;

    return _repository.orderList(params: params).then((value) {
      wrapper = value;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
