/*
 * @Description: 控制器
 * @Author: iamsmiling
 * @Date: 2021-01-15 23:03:21
 * @LastEditTime: 2021-01-16 13:28:31
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/domain/repository/product/product_repository.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class FinishedProductAttrsController extends GetxController {
  ProductDetailModel product;
  int id;
  FinishedProductAttrsController({this.product, this.id});

  ProductRepository _repository = ProductRepository();
  XLoadState loadState = XLoadState.idle;

  Future _loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.productDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      product = wrapper.detailModel;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    if (product == null) {
      _loadData();
    }
    super.onInit();
  }

  void select(ProductSpecOptionModel option) {
    option.isChecked = !option.isChecked;
    update();
  }

  void validate() {}
}
