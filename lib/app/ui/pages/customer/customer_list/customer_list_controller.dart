/*
 * @Description:客户列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:09:30
 * @LastEditTime: 2020-12-21 17:56:41
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class CustomerListController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  CustomerModelListWrapper wrapper;

  XLoadState loadState = XLoadState.idle;
  Future<CustomerModelListWrapper> _loadData() {
    loadState = XLoadState.busy;

    return _repository.customerList().then((CustomerModelListWrapper value) {
      wrapper = value;
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
