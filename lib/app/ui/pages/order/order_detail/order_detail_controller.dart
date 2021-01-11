/*
 * @Description: OrderDetailController
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:35:30
 * @LastEditTime: 2021-01-10 21:39:33
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_detail_model.dart';
import 'package:taojuwu/app/domain/model/order/order_detail_product_model.dart';
// import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/repository/order/order_repository.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class OrderDetailController extends GetxController {
  OrderRepository _repository = OrderRepository();

  OrderDetailModel order;

  OrderDetailProductModel currentProduct;
  XLoadState loadState = XLoadState.idle;
  Future<OrderDetailModelWrapper> _loadData() {
    final id = Get.parameters["id"];
    loadState = XLoadState.busy;
    update();
    return _repository.orderDetail(params: {"order_id": id}).then((value) {
      order = value.orderDetailModel;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future select() {
    return _repository
        .selectProduct(params: {"order_goods_id": currentProduct.id})
        .catchError((err) {})
        .whenComplete(() {
          Get.until((route) =>
              RegExp(AppRoutes.orderDetail).hasMatch(Get.currentRoute));
          _loadData();
        });
  }

  Future goToSelect(OrderDetailProductModel product) {
    currentProduct = product;
    return Get.toNamed(AppRoutes.selectableProductList);
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
