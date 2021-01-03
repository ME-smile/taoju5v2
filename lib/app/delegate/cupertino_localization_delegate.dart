/*
 * @Description:CupertinoLocalizationDelegate本地化地理
 * @Author: iamsmiling
 * @Date: 2020-12-28 21:59:33
 * @LastEditTime: 2020-12-28 22:00:58
 */
import 'package:flutter/cupertino.dart';

class CupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return DefaultCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<CupertinoLocalizations> old) {
    return false;
  }

  static CupertinoLocalizationDelegate delegate =
      CupertinoLocalizationDelegate();
}
