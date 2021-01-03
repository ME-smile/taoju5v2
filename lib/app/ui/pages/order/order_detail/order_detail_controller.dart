/*
 * @Description: OrderDetailController
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:35:30
 * @LastEditTime: 2020-12-22 15:58:44
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_detail_model.dart';
import 'package:taojuwu/app/domain/repository/order/order_repository.dart';

class OrderDetailController extends GetxController {
  OrderRepository _repository = OrderRepository();

  OrderDetailModelWrapper wrapper;
  Future<OrderDetailModelWrapper> loadData({Map params}) {
    final id = Get.parameters["id"];
    return _repository.orderDetail(params: {"id": id}).then((value) => null);
  }
}
