/*
 * @Description: CustomerAddressEditController
 * @Author: iamsmiling
 * @Date: 2020-12-22 11:19:26
 * @LastEditTime: 2021-01-11 15:40:35
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/constants/x_gender.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';
import 'package:taojuwu/app/interface/i_xselectable.dart';

class CustomerGenderOptionModel implements IXSelectable {
  @override
  bool isChecked;
  XGender gender;
  String name;

  CustomerGenderOptionModel(
      {this.isChecked = false, @required this.gender, @required this.name});
}

class CustomerAddressEditController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  CustomerDetailModel customer = Get.arguments;

  String get customerId => Get.parameters["id"];

  List<CustomerGenderOptionModel> genderOptions = [
    CustomerGenderOptionModel(
        gender: XGender.male, name: "先生", isChecked: true),
    CustomerGenderOptionModel(
        gender: XGender.female, name: "女士", isChecked: false),
  ];

  Future _loadData() {
    print("加载数据");
    return _repository.customerDetail(params: {"id": customerId}).then(
        (CustomerDetailModel value) {
      customer = value;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    customer ?? _loadData();
    super.onInit();
  }

  void selectGender(CustomerGenderOptionModel option) {
    genderOptions.forEach((e) {
      e.isChecked = e == option;
    });
    update(["gender"]);
  }
}
