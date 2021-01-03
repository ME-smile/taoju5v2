/*
 * @Description: 常用工具方法
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:44:12
 * @LastEditTime: 2020-12-24 13:10:41
 */

abstract class CommonKit {
  static bool isNullOrZero(dynamic value) {
    if (value == null) return true;
    return value == 0;
  }
}
