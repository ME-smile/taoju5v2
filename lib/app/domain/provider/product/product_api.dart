/*
 * @Description: 商品相关api
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:26:26
 * @LastEditTime: 2021-01-10 21:05:52
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

  ///商品列表过滤条件
  Future<BaseResponse> filterTag(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///场景详情
  Future<BaseResponse> sceneDesignProductDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///软装详情
  Future<BaseResponse> softDesignProductDetail(String url, {Map params}) =>
      XDio().get(url, params: params);
}
