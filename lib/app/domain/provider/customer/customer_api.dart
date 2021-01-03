/*
 * @Description: 客户相关api
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:09:48
 * @LastEditTime: 2020-12-22 09:09:43
 */

import 'package:taojuwu/app/xdio/x_dio.dart';

class CustomerAPI {
  Future<BaseResponse> customerList(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> customerDetail(String url, {Map params}) =>
      XDio().get(url, params: params);
}
