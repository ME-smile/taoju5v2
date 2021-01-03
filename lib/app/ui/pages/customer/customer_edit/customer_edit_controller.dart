/*
 * @Description: CustomerEditController
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:14
 * @LastEditTime: 2020-12-29 13:26:35
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';

class CustomerEditController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  ///[target]修改句柄
  CustomerDetailModel target = Get.arguments ?? CustomerDetailModel();
}
