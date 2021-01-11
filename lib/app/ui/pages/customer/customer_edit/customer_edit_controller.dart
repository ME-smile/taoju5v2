/*
 * @Description: CustomerEditController
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:14
 * @LastEditTime: 2021-01-11 13:46:24
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_controller.dart';

class CustomerEditController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  ///[target]修改句柄
  CustomerDetailModel target = Get.arguments ?? CustomerDetailModel();

  Future edit() {
    print(target);
    print(target.toJson());
    return _repository.editCustomer(params: target.toJson()).then((value) {
      _confirm();
    });
  }

  void _confirm() {
    ///更新客户详情
    CustomerDetailController detailController =
        Get.find<CustomerDetailController>();
    detailController.customer = target;
    detailController.update();

    ///更新商品列表页
    CustomerListController listController = Get.find<CustomerListController>();
    listController?.loadData();

    ///返回上一页
    Get.back();
  }
}
