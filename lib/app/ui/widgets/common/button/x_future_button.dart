/*
 * @Description: 网络请求按钮
 * @Author: iamsmiling
 * @Date: 2021-01-11 15:27:45
 * @LastEditTime: 2021-01-15 09:40:09
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
  final Function onSuccess;
  final Function onError;
  final String successTip;
  final String failTip;
  const XFutureButton(
      {Key key,
      @required this.onFuture,
      this.buttonMode = ButtonMode.elevated,
      this.child,
      this.onComplete,
      this.onSuccess,
      this.onError,
      this.successTip = "提交成功",
      this.failTip = "提交失败"})
      : super(key: key);

  Future _onTap() {
    EasyLoading.show();
    return onFuture().then((value) {
      if (onSuccess != null) {
        EasyLoading.showSuccess(successTip);
        onSuccess();
      }
    }).catchError((err) {
      if (onError != null) {
        EasyLoading.showError(err ?? failTip);
        onError();
      }
    }).whenComplete(() {
      EasyLoading.dismiss();
      if (onComplete != null) {
        onComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (buttonMode == ButtonMode.elevated) {
      return ElevatedButton(onPressed: _onTap, child: child);
    }
    return OutlineButton(onPressed: _onTap, child: child);
  }
}
