/*
 * @Description: 网络请求按钮
 * @Author: iamsmiling
 * @Date: 2021-01-11 15:27:45
 * @LastEditTime: 2021-01-11 17:14:35
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taojuwu/app/type_defs/type_defs.dart';

enum ButtonMode { outline, elevated }

class XFutureButton extends StatelessWidget {
  final FutureCallback onFuture;
  final ButtonMode buttonMode;
  final Widget child;
  final Function onComplete;
  const XFutureButton(
      {Key key,
      this.onFuture,
      this.buttonMode = ButtonMode.elevated,
      this.child,
      this.onComplete})
      : super(key: key);

  Future _onTap() {
    EasyLoading.show();
    return onFuture()
        .then((value) {
          EasyLoading.dismiss();
        })
        .catchError((err) {})
        .whenComplete(onComplete);
  }

  @override
  Widget build(BuildContext context) {
    if (buttonMode == ButtonMode.elevated) {
      return ElevatedButton(onPressed: _onTap, child: child);
    }
    return OutlineButton(onPressed: _onTap, child: child);
  }
}
