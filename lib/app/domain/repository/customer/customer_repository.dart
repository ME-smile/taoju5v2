/*
 * @Description: 客户相关
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:11:21
 * @LastEditTime: 2021-01-16 16:15:33
 */

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/model/customer/customer_model.dart';
import 'package:taojuwu/app/domain/provider/customer/customer_api.dart';
import 'package:taojuwu/app/xdio/x_dio.dart';

class CustomerRepository {
  CustomerAPI _api = CustomerAPI();

  Future<CustomerModelListWrapper> customerList() {
    return _api.customerList("/api/client/lists").then((BaseResponse response) {
      if (response.isValid)
        return CustomerModelListWrapper.fromJson(response.data);
      throw EasyLoading.showError(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<CustomerDetailModel> customerDetail({Map params}) {
    return _api
        .customerList("/api/client/info", params: params)
        .then((BaseResponse response) {
      if (response.isValid) return CustomerDetailModel.fromJson(response.data);
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<CustomerDetailModel> editCustomer({Map params}) {
    return _api
        .editCustomer("/api/client/add", params: params)
        .then((BaseResponse response) {
      if (response.isValid) return CustomerDetailModel.fromJson(response.data);
      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  Future<BaseResponse> editAddress({Map params}) {
    return _api
        .editCustomer("/api/member/addAddress", params: params)
        .then((BaseResponse response) {
      if (response.isValid) return response;
      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }
}
