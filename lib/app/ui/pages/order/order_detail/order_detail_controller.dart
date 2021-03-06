/*
 * @Description: OrderDetailController
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:35:30
 * @LastEditTime: 2021-01-15 14:17:47
 */

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/order/order_detail_model.dart';
import 'package:taojuwu/app/domain/model/order/order_detail_product_model.dart';
import 'package:taojuwu/app/domain/model/order/order_price_model.dart';
import 'package:taojuwu/app/domain/model/order/refund_status.dart';
// import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/repository/order/order_repository.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/dialog/order/cancel_order.dart';
import 'package:taojuwu/app/ui/dialog/order/cancel_product.dart';
import 'package:taojuwu/app/ui/dialog/order/order_remind.dart';
import 'package:taojuwu/app/ui/modal/order/modify_price.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

enum ModifyPriceMode { amount, discount }

///修改价格参数模型
class ModifyPriceParamsModel {
  String amount;
  String note;
  String orderId;
  ModifyPriceMode modifyPriceMode;
  String originPrice;
  String discount = "10";
  ModifyPriceParamsModel(
      {this.amount,
      this.note,
      this.orderId,
      this.originPrice = "0",
      this.modifyPriceMode = ModifyPriceMode.amount});

  Map get params => {
        "adjust_money": deltaPrice,
        "adjust_money_remark": note,
        "order_id": orderId
      };

  String get currentPrice {
    double initialPrice = double.tryParse(originPrice) ?? 0;
    double inputDiscount = double.tryParse(discount) ?? 0;
    return (initialPrice * (inputDiscount / 10))?.toStringAsFixed(2) ?? "";
  }

  ///计算差价
  String get deltaPrice {
    double initialPrice = double.tryParse(originPrice) ?? 0;
    if (modifyPriceMode == ModifyPriceMode.amount) {
      double inputPrice = double.tryParse(amount) ?? 0;
      return (initialPrice - inputPrice).toStringAsFixed(2);
    }
    double inputDiscount = double.tryParse(discount) ?? 0;
    return (initialPrice * (inputDiscount / 10)).toStringAsFixed(2);
  }

  set isAmountMode(bool flag) {
    modifyPriceMode = flag ? ModifyPriceMode.amount : ModifyPriceMode.discount;
  }
}

class CancelOrderParamsModel {
  String orderId;
  String reason;
  CancelOrderParamsModel({@required this.orderId, this.reason = ""});

  Map get params => {"order_id": orderId, "order_close_reason": reason};
}

class CancelProductParamsModel {
  String orderId;
  String productId;
  CancelProductParamsModel({@required this.orderId, @required this.productId});
  Map get params => {"order_id": orderId, "order_goods_id": productId};
}

class RemindOrderParamsModel {
  String orderId;
  String status;
  RemindOrderParamsModel({@required this.orderId, @required this.status});
  Map get params => {"order_id": orderId, "status": status};
}

class OrderDetailController extends GetxController {
  OrderRepository _repository = OrderRepository();

  OrderDetailModel order;

  OrderDetailProductModel currentProduct;
  XLoadState loadState = XLoadState.idle;

  ///加载数据
  Future<OrderDetailModelWrapper> _loadData() {
    final id = Get.parameters["id"];
    loadState = XLoadState.busy;
    update();
    return _repository.orderDetail(params: {"order_id": id}).then((value) {
      order = value.orderDetailModel;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future select() {
    return _repository
        .selectProduct(params: {"order_goods_id": currentProduct.id})
        .catchError((err) {})
        .whenComplete(() {
          Get.until((route) =>
              RegExp(AppRoutes.orderDetail).hasMatch(Get.currentRoute));
          _loadData();
        });
  }

  Future goToSelect(OrderDetailProductModel product) {
    currentProduct = product;
    return Get.toNamed(AppRoutes.selectableProductList);
  }

  ///打开修改价格弹窗
  Future openModifyPriceModal() {
    return showModifyPriceModal();
  }

  ///发起修改价格请求
  Future modifyPrice(ModifyPriceParamsModel model) {
    return _repository
        .modifyPrice(params: model.params)
        .then((OrderPriceModel model) {
      order.balance = model.balance;
      order.modifyPriceNote = model.modifyPriceNote;
      order.payAmount = model.payAmount;
      order.deltaPrice = model.deltaPrice;
      update(["modifyPrice"]);
    });
  }

  void switchModifyPriceMode() {
    update(["modifyPriceMode"]);
  }

  Future openCancelOrderDialog() {
    return showCancelOrderDialog(Get.context);
  }

  Future cancelOrder(CancelOrderParamsModel model) {
    return _repository.cancelOrder(params: model.params).then((_) {
      order.refundStatus = RefundStatus.toBeAuthed;
      update(["buttonState"]);
    });
  }

  Future openCancelProductDialog(OrderDetailProductModel product) {
    return showCancelProductDialog(Get.context, product: product);
  }

  Future cancelProduct(CancelProductParamsModel model,
      {@required OrderDetailProductModel product}) {
    return _repository.cancelProduct(params: model.params).then((_) {
      product.refundStatus = RefundStatus.toBeAuthed;
      update(["${product.id}"]);

      ///如果全部商品都取消 更显按钮状态
      if (order.isAllProductCanceled) {
        update(["buttonState"]);
      }
    });
  }

  Future openRemindOrderDialog() {
    return showOrderRemindDialog();
  }

  Future remind(RemindOrderParamsModel model) {
    return _repository.remind(params: model.params).then((_) {});
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
