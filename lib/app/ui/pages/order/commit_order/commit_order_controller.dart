/*
 * @Description: 提交订单
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:49:00
 * @LastEditTime: 2020-12-31 09:26:37
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_adapter_model.dart';

class CommitOrderController extends GetxController {
  List<ProductAdapterModel> productList;
  @override
  void onInit() {
    productList = Get.arguments;
    super.onInit();
  }
}
