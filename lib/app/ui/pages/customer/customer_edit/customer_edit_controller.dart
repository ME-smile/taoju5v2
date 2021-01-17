/*
 * @Description: CustomerEditController
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:14
 * @LastEditTime: 2021-01-13 09:32:02
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taojuwu/app/utils/x_logger.dart';

class CustomerEditController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  ///[target]修改句柄
  CustomerDetailModel target = Get.arguments ?? CustomerDetailModel();

  Future edit() {
    XLogger.v(target.toJson());
    return _repository.editCustomer(params: target.toJson());
  }

  void confirm() {
    ///更新客户详情
    if (Get.isRegistered<CustomerDetailController>()) {
      CustomerDetailController detailController =
          Get.find<CustomerDetailController>();
      detailController.customer = target;
      detailController.update();
    }
    if (Get.isRegistered<CustomerListController>()) {
      ///更新客户列表页
      CustomerListController listController =
          Get.find<CustomerListController>();
      listController?.loadData();
    }
    // Get.back();
  }
}
