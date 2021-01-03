/*
 * @Description: 商品相关api
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:26:26
 * @LastEditTime: 2020-12-29 17:43:50
 */

import 'package:taojuwu/app/xdio/x_dio.dart';

class ProductAPI {
  Future<BaseResponse> productList(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> productDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///购物车列表
  Future<BaseResponse> cartList(String url, {Map params}) =>
      XDio().get(url, params: params);
}
