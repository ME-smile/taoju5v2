/*
 * @Description: 通用文字字体定义
 * @Author: iamsmiling
 * @Date: 2020-11-27 21:25:26
 * @LastEditTime: 2021-01-15 09:23:58
 */
import 'package:flutter/material.dart';

import 'x_colors.dart';
import 'x_dimens.dart';

class XStyles {
  static TextStyle unselectedLabelStyle = TextStyle(
    fontSize: XDimens.sp32,
    color: XColors.unSelectedTextColor,
  );

  static TextStyle selectedLabelStyle = TextStyle(
      fontSize: XDimens.sp32,
      color: XColors.selectedTextColor,
      fontWeight: FontWeight.bold);

  static TextStyle bodyText1 =
      TextStyle(fontSize: XDimens.sp28, color: XColors.textColor);

  static TextStyle dialogTitle = TextStyle(
      fontSize: XDimens.sp36,
      color: XColors.titleColor,
      fontWeight: FontWeight.w500);

  static TextStyle dialogContent = TextStyle(
      fontSize: 16, color: XColors.contentColor, fontWeight: FontWeight.w400);

  static TextStyle linkText = TextStyle(color: XColors.linkTextColor);

  static TextStyle tipText =
      TextStyle(color: XColors.tipColor, fontSize: XDimens.sp28);

  static TextStyle inputLabelText =
      TextStyle(color: XColors.inputLabelColor, fontSize: XDimens.sp28);

  static TextStyle placeHolderText =
      TextStyle(color: XColors.placeHolderColor, fontSize: XDimens.sp28);
}
