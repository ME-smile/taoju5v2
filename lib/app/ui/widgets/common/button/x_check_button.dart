/*
 * @Description: XCheckButton 带三角边框的按钮
 * @Author: iamsmiling
 * @Date: 2020-12-24 14:24:44
 * @LastEditTime: 2020-12-24 15:32:46
 */
import 'package:flutter/material.dart';
import 'package:taojuwu/app/interface/i_xselectable.dart';

import 'x_border_frame.dart';

class XCheckButton extends StatelessWidget {
  ///[isChecked]当前是否选中
  final IXSelectable target;

  ///[callback]点击时的回调
  final Function callback;

  final BoxConstraints constraints;

  final Color unCheckedColor;

  ///[child]  按钮视图
  final Widget child;

  const XCheckButton(
      {Key key,
      @required this.target,
      @required this.callback,
      @required this.child,
      this.unCheckedColor = const Color(0xFFCBCBCB),
      this.constraints = const BoxConstraints(minWidth: 72, minHeight: 32)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: ConstrainedBox(
        constraints: constraints,
        child: XBorderFrame(
          unCheckedBorderColor: unCheckedColor,
          visible: target.isChecked ?? false,
          child: child ?? Container(),
        ),
      ),
    );
  }
}
