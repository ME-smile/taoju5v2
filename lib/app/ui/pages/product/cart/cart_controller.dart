/*
 * @Description: 购物车
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:29:31
 * @LastEditTime: 2020-12-31 17:56:06
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';

class CartController extends GetxController {
  ProductRepository _repository = ProductRepository();

  int get clientId => Get.find<CustomerProviderController>().id;

  Future _loadData() {
    return _repository.cartList(params: {"client_uid": clientId});
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
