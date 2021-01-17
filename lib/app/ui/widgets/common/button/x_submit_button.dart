/*
 * @Description: 提交按钮封装
 * @Author: iamsmiling
 * @Date: 2021-01-12 16:33:37
 * @LastEditTime: 2021-01-14 16:42:14
 */

import 'package:flutter/material.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/type_defs/type_defs.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_future_button.dart';

class XSubmitButton extends StatelessWidget {
  final Widget child;
  final FutureCallback onFuture;
  final Function onSuccess;
  final Function(dynamic message) onError;
  final Function onComplete;
  const XSubmitButton(
      {Key key,
      @required this.child,
      @required this.onFuture,
      this.onSuccess,
      this.onError,
      this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + 16,
      padding: EdgeInsets.symmetric(horizontal: XDimens.gap48, vertical: 8),
      child: XFutureButton(
        onFuture: onFuture,
        onComplete: onComplete,
        onError: onError,
        onSuccess: onSuccess,
        child: child,
      ),
    );
  }
}
