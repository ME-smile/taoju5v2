/*
 * @Description: 常用工具方法
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:44:12
 * @LastEditTime: 2021-01-11 13:58:35
 */

import 'package:taojuwu/app/extensions/datetime_kit.dart';

abstract class CommonKit {
  static bool isNullOrZero(dynamic value) {
    if (value == null) return true;
    return value == 0;
  }

  static String formatDateTime(DateTime dateTime,
      {String format: "yyyy-MM-dd"}) {
    return dateTime.formatDate(format: format);
  }
}
