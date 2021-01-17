/*
 * @Description: 常用工具方法
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:44:12
 * @LastEditTime: 2021-01-12 20:19:54
 */

import 'package:get/get_utils/get_utils.dart';
import 'package:taojuwu/app/config/net_config.dart';
import 'package:taojuwu/app/extensions/datetime_kit.dart';

abstract class CommonKit {
  static bool isNullOrZero(dynamic value) {
    if (value == null) return true;
    return value == 0;
  }

  static String formatDateTime(DateTime dateTime,
      {String format: "yyyy-MM-dd HH:mm:ss"}) {
    return dateTime.formatDate(format: format);
  }

  static String asWebUrl(String path) {
    if (GetUtils.isNullOrBlank(path)) return path;
    if (GetUtils.isImage(path)) {
      if (GetUtils.hasMatch(path, "(http|https)")) return path;
      return NetConfig.baseUrl + (path.startsWith("/") ? path : "/$path");
    }
    return path;
  }
}
