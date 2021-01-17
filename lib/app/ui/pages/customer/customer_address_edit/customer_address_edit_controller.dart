/*
 * @Description: CustomerAddressEditController
 * @Author: iamsmiling
 * @Date: 2020-12-22 11:19:26
 * @LastEditTime: 2021-01-16 18:47:00
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/constants/x_gender.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';
import 'package:taojuwu/app/interface/i_xselectable.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';

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

  CustomerDetailModel customer;

  final customerProviderController = Get.find<CustomerProviderController>();

  String get customerId => Get.parameters["id"];

  List<CustomerGenderOptionModel> genderOptions = [
    CustomerGenderOptionModel(
        gender: XGender.male, name: "先生", isChecked: true),
    CustomerGenderOptionModel(
        gender: XGender.female, name: "女士", isChecked: false),
  ];

  Future _loadData() {
    return _repository.customerDetail(params: {"id": customerId}).then(
        (CustomerDetailModel value) {
      customer = value;
      customerProviderController.customer.address = customer.address;
      genderOptions.forEach((e) {
        e.isChecked = e.gender == customer.gender;
      });
    }).whenComplete(update);
  }

  Future edit() {
    print(customer?.toJson());
    return _repository.editAddress(params: customer?.toJson()).then((value) {
      customerProviderController.customer?.address?.addressId = value.data;
      customerProviderController.update(["address"]);
    });
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void selectGender(CustomerGenderOptionModel option) {
    genderOptions.forEach((e) {
      e.isChecked = e == option;
    });
    customer.gender = option.gender;
    update(["gender"]);
  }
}
