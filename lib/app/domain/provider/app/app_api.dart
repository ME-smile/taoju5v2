/*
 * @Description: [app]相关的网络请求
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:53:24
 * @LastEditTime: 2021-01-11 17:26:36
 */

import 'package:taojuwu/app/xdio/x_dio.dart';

class AppAPI {
  Future<BaseResponse> appInfo(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> upgradeApp(String url, {Map params}) =>
      XDio().get(url, params: params);
}
