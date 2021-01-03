/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-29 11:43:32
 * @LastEditTime: 2020-12-31 17:54:54
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';

class CustomerProviderController extends GetxController {
  CustomerModel _customer;

  String get name =>
      GetUtils.isNullOrBlank(_customer?.name) ? "请选择" : _customer?.name;

  int get id => _customer?.id;

  set customer(CustomerModel model) {
    _customer = model;
    update();
  }

  clear() {
    _customer = null;
    update();
  }
}
