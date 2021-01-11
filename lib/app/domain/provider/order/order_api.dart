/*
 * @Description: 订单相关api
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:02:51
 * @LastEditTime: 2021-01-10 21:06:00
 */

import 'package:taojuwu/app/xdio/x_dio.dart';

class OrderAPI {
  Future<BaseResponse> orderList(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> orderDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///确认选品
  Future<BaseResponse> selectProduct(String url, {Map params}) =>
      XDio().get(url, params: params);
}
