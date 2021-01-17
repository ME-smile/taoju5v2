/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-29 11:43:32
 * @LastEditTime: 2021-01-17 11:56:37
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';

class CustomerProviderController extends GetxController {
  CustomerModel _customer;

  String get abbrName {
    if (_customer == null || _customer?.name == null) return "请选择";
    if (_customer.name.length > 12) {
      return _customer.name.substring(0, 8) +
          "..." +
          _customer.name.substring(8, 11);
    }
    return _customer.name;
  }

  String get name =>
      GetUtils.isNullOrBlank(_customer?.name) ? "请选择" : _customer?.name;

  String get id => _customer?.id;
  CustomerModel get customer => _customer;
  set customer(CustomerModel model) {
    _customer = model;
    update();
  }

  clear() {
    _customer = null;
    update();
  }

  void updateCartCount(int count) {
    _customer.cartCount = count;
    update(["count"]);
  }
}
