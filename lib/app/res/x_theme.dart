/*
 * @Description: 主题相关配置
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:07:11
 * @LastEditTime: 2021-01-15 09:24:12
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taojuwu/app/res/x_colors.dart';

import 'x_dimens.dart';
import 'x_styles.dart';

class XTheme {
  bool isDarkMode = false;

  static ThemeData lightTheme = ThemeData(
      cursorColor: XColors.foregroundColor,
      backgroundColor: XColors.foregroundColor,
      accentColor: XColors.foregroundColor,
      primaryColor: XColors.primaryColor,
      buttonColor: XColors.buttonColor,
      primaryColorDark: XColors.primaryColor,
      primaryColorLight: XColors.foregroundColor,
      // primaryTextTheme: TextTheme(

      // ),

      iconTheme: IconThemeData(color: XColors.iconColor, size: XDimens.sp36),
      dividerTheme:
          DividerThemeData(color: XColors.dividerColor, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: XColors.indicatorColor, width: 2),
            insets: EdgeInsets.symmetric(horizontal: 8)),

        labelPadding: EdgeInsets.only(
            bottom: XDimens.gap10, right: XDimens.gap10, left: XDimens.gap10),
        indicatorSize: TabBarIndicatorSize.label,
        // unselectedLabelStyle: XStyles.unselectedLabelStyle,
        // labelStyle: XStyles.selectedLabelStyle,
      ),
      textTheme: TextTheme(bodyText1: XStyles.bodyText1),
      // primarySwatch: MaterialColor(primary, swatch),
      timePickerTheme: TimePickerThemeData(
          dialHandColor: XColors.foregroundColor,
          backgroundColor: XColors.foregroundColor,
          dialBackgroundColor: XColors.foregroundColor,
          dayPeriodColor: XColors.foregroundColor,
          entryModeIconColor: XColors.foregroundColor),
      dialogTheme: DialogTheme(
          titleTextStyle: XStyles.dialogTitle,
          contentTextStyle: XStyles.dialogContent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
            TextStyle(color: XColors.primaryColor, fontSize: XDimens.sp28)),
        backgroundColor: MaterialStateProperty.all(XColors.buttonColor),
        // foregroundColor: MaterialStateProperty.all(XColors.buttonColor),
        // overlayColor: MaterialStateProperty.all(XColors.buttonColor),
        // minimumSize: MaterialStateProperty.all(
        //     Size(XDimens.minW172, XDimens.minH64))
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(XColors.textColor),
              // minimumSize: MaterialStateProperty.all(
              //     Size(XDimens.minW172, XDimens.minH64)),
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: XDimens.sp28, color: XColors.textColor)),
              side: MaterialStateProperty.all(
                  BorderSide(color: XColors.outlineBorderColor, width: 1)))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(XColors.textColor),
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: XDimens.sp28, color: XColors.textColor)),
      )),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: XStyles.inputLabelText,
          hintStyle: XStyles.placeHolderText,
          focusColor: XColors.foregroundColor,
          hoverColor: XColors.foregroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: XDimens.gap32),

          // alignLabelWithHint: true,
          // isCollapsed: true,
          // isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: XColors.dividerColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: XColors.dividerColor))),
      // textButtonTheme: ,
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: XColors.primaryColor),
      buttonTheme: ButtonThemeData(
          disabledColor: XColors.disabledColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          buttonColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))));
}
