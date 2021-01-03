/*
 * @Description: 淘居屋
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:58:46
 * @LastEditTime: 2020-12-21 16:39:15
 */

import 'package:taojuwu/app/xdio/x_dio.dart';

class TaojuwuAPI {
  Future<BaseResponse> curtainProductAttrs(String url) => XDio().get(url);
}
