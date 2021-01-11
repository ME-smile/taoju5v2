/*
 * @Description: 提交订单
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:49:00
 * @LastEditTime: 2021-01-11 15:48:09
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';
import 'package:taojuwu/app/domain/model/product/product_adapter_model.dart';
import 'package:taojuwu/app/domain/model/user/user_info_model.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/pages/home/user_provider_controller.dart';

class CommitOrderParamsModel {
  DateTime measureTime;
  DateTime installTime;
  String deposit;
  String note;
  String windowCount;

  CommitOrderParamsModel(
      {this.measureTime,
      this.installTime,
      this.deposit,
      this.note,
      this.windowCount});
}

class CommitOrderController extends GetxController {
  List<ProductAdapterModel> productList;

  CommitOrderParamsModel params = CommitOrderParamsModel();

  @override
  void onInit() {
    productList = Get.arguments ?? [];
    super.onInit();
  }

  UserProviderController get userProviderController =>
      Get.find<UserProviderController>();

  UserInfoModel get user => userProviderController.user;

  CustomerProviderController get customerProviderController =>
      Get.find<CustomerProviderController>();

  CustomerModel get customer => customerProviderController.customer;
}
