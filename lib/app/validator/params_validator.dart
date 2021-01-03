/*
 * @Description: 参数校验器
 * @Author: iamsmiling
 * @Date: 2020-12-29 10:41:59
 * @LastEditTime: 2020-12-29 17:30:19
 */

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/utils.dart';

abstract class ParamsValidator {
  bool isPhoneNumber(String text, {String message = "请输入正确的手机号"}) {
    if (!GetUtils.isPhoneNumber(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    return true;
  }

  bool isNullOrBlank(String text, {@required String message}) {
    if (!GetUtils.isNullOrBlank(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    return true;
  }

  bool isPassword(String text, {@required String message, RegExp pattern}) {
    if (GetUtils.isNullOrBlank(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    if (pattern != null && !pattern.hasMatch(text)) {
      EasyLoading.showInfo(message);
      return false;
    }
    return true;
  }

  bool validate({var flag});
}
