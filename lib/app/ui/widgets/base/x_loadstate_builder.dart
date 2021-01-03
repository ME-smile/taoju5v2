/*
 * @Description: 网络状态
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:04:29
 * @LastEditTime: 2020-12-21 14:12:08
 */

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:taojuwu/app/type_defs/type_defs.dart';
import 'package:taojuwu/app/ui/widgets/base/x_empty_widget.dart';
import 'package:taojuwu/app/ui/widgets/base/x_error_widget.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loading_widget.dart';

import 'x_view_state.dart';

class XLoadStateBuilder extends StatelessWidget {
  final Widget loadingWidget;
  final Widget errorWidget;
  final Widget emptyWidget;
  final XLoadState loadState;
  final WidgetBuilder builder;
  final FutureCallback retry;
  XLoadStateBuilder(
      {Key key,
      this.loadingWidget = const XLoadingWidget(),
      @required this.builder,
      this.loadState = XLoadState.busy,
      this.retry})
      : errorWidget = XErrorWidget(
          retry: retry,
        ),
        emptyWidget = XEmptyWidget(
          retry: retry,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    if (loadState == XLoadState.busy) {
      return loadingWidget;
    }
    if (loadState == XLoadState.error) {
      return errorWidget;
    }
    if (loadState == XLoadState.empty) {
      return emptyWidget;
    }
    return Builder(builder: builder);
  }
}
