/*
 * @Description: 提交订单
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:49:00
 * @LastEditTime: 2021-01-16 20:15:34
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';
import 'package:taojuwu/app/domain/model/product/product_adapter_model.dart';
import 'package:taojuwu/app/domain/model/product/product_type.dart';
import 'package:taojuwu/app/domain/model/user/user_info_model.dart';
import 'package:taojuwu/app/domain/repository/order/order_repository.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/home/customer_provider_controller.dart';
import 'package:taojuwu/app/ui/pages/home/user_provider_controller.dart';
import 'package:taojuwu/app/utils/x_logger.dart';

///测量单参数模型
class OptionalOrderParamsModel {
  DateTime measureTime;
  DateTime installTime;
  String deposit;
  String note;
  String windowCount;

  OptionalOrderParamsModel(
      {this.measureTime,
      this.installTime,
      this.deposit,
      this.note = "",
      this.windowCount = ""});

  Map get params => {
        "order_earnest_money": deposit ?? '',
        "measure_time": measureTime ?? '',
        "install_time": installTime ?? '',
        "order_remark": note ?? '',
        "order_window_num": windowCount ?? '',
      };
}

///选品单参数模型
class CommitOrderParamsModel {
  List<ProductAdapterModel> productList;
  OptionalOrderParamsModel optionalParams;
  CustomerModel get customer => Get.find<CustomerProviderController>().customer;
  CommitOrderParamsModel(
      {@required this.optionalParams, @required this.productList});
  String get measureId =>
      productList
          ?.map((e) => (e.productType is CurtainProductType ? e.measureId : 0))
          ?.join(",") ??
      "";
  String get productSku => productList
      .map((e) =>
          "${e?.skuId ?? 0}:${e.count ?? 1}:${e?.length ?? 0}:${e?.totalPrice}")
      .join(",");

  String get cartId => productList.map((e) => "${e.cartId}").join(",");

  String get shopId => "${Get.find<UserProviderController>().user.shopId}";
  Map get params {
    Map map = optionalParams.params;
    map.addAll({
      'measure_id': measureId,
      "client_uid": customer?.id,
      "cart_id": cartId,
      "shop_id": shopId,
      "data": """{
         "order_type": "1",
          "point": "0",
          "pay_type": "10",
          "shipping_info": {"shipping_type": "1", "shipping_company_id": "0"},
          "coupon_id": "0",
          "order_tag": "2",
          "address_id":${customer?.address?.addressId},
          "goods_sku_list":"$productSku"
      }"""
    });
    return map;
  }
}

class CommitOrderController extends GetxController {
  OrderRepository _repository = OrderRepository();
  List<ProductAdapterModel> productList =
      (Get.arguments ?? [])?.cast<ProductAdapterModel>();

  CommitOrderParamsModel params;
  bool isMeasureOrder;
  @override
  void onInit() {
    productList = (Get.arguments ?? [])?.cast<ProductAdapterModel>();
    params = CommitOrderParamsModel(
        optionalParams: OptionalOrderParamsModel(), productList: productList);
    isMeasureOrder = Get.parameters["orderType"] == "2";
    super.onInit();
  }

  UserProviderController get userProviderController =>
      Get.find<UserProviderController>();

  UserInfoModel get user => userProviderController.user;

  CustomerProviderController get customerProviderController =>
      Get.find<CustomerProviderController>();

  CustomerModel get customer => customerProviderController.customer;

  Future submitOrder() {
    XLogger.v(params.params);

    XLogger.v(Get.parameters);
    return _repository.submitOrder(
        params: params.params, isMeasureOrder: isMeasureOrder);
  }

  Future onSubmitSuceess() async {
    return Get.toNamed(AppRoutes.commitOrderSuccess);
  }
}
