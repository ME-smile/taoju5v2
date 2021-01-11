/*
 * @Description: 场景详情控制器 逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:49:16
 * @LastEditTime: 2021-01-10 14:26:12
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/design_product_detail_model.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class SceneProductDetailController extends GetxController {
  ProductRepository _repository = ProductRepository();
  final id = Get.parameters["id"];

  DesignProductDetailModel product;
  List<ProductModel> list;
  XLoadState loadState = XLoadState.idle;
  Future _loadData() {
    loadState = XLoadState.busy;
    return _repository.sceneDesignProductDetail(params: {"scenes_id": id}).then(
        (DesignProductDetailModelWrapper value) {
      product = value.product;

      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
