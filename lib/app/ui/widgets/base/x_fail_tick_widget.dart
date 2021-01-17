/*
 * @Description: 提交失败
 * @Author: iamsmiling
 * @Date: 2021-01-13 09:23:07
 * @LastEditTime: 2021-01-15 20:10:49
 */
/*
 * @Description: 打钩动画
 * @Author: iamsmiling
 * @Date: 2021-01-12 22:07:45
 * @LastEditTime: 2021-01-12 22:20:34
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class XTickFailView extends StatefulWidget {
  XTickFailView({Key key}) : super(key: key);

  @override
  _XTickFailViewState createState() => _XTickFailViewState();
}

GlobalKey<_XTickFailViewState> tickSuccessViewKey = GlobalKey();

class _XTickFailViewState extends State<XTickFailView>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    /// AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字，总时长
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );

    /// 开始快，后面慢
    Animation curveAnimation = new CurvedAnimation(
        parent: _animationController, curve: Curves.easeOut);

    /// 设置输出范围值，这里分两个动画步骤，0 -> 1表示画圆， 1 -> 2 表示画右边 2->3表示画左边
    _animation = Tween<double>(begin: 0.0, end: 3.0).animate(curveAnimation);

    /// 开始动画
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 优化方式
    return Container(
      child: TickSuccessAnimation(_animation),
    );
  }

  /// 开始动画
  startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }
}

/// AnimatedWidget优化动画
class TickSuccessAnimation extends AnimatedWidget {
  TickSuccessAnimation(Animation animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;

    /// size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。
    /// 如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。
    return CustomPaint(
      size: Size.square(96.0),
      painter: _TickFailPainter(animation.value),
    );
  }
}

class _TickFailPainter extends CustomPainter {
  Paint viewPaint;
  Path path;
  final double progress;

  _TickFailPainter(this.progress) {
    viewPaint = Paint()
      // ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;
    path = Path();
  }

  // Method to convert degree to radians
  num degToRad(num deg) => deg * (Math.pi / 180.0);

  @override
  void paint(Canvas canvas, Size size) {
    print("progress $progress");

    /// 原点x,y坐标
    double x = size.width / 2;
    double y = size.height / 2;
    double radius = size.width / 3;

    path.relativeMoveTo(x, y);
    // path.moveTo(x, y);

    /// 背景圆
    path.addArc(
        Rect.fromCenter(
          center: Offset(x, y),
          width: radius * 2,
          height: radius * 2,
        ),
        degToRad(0),
        degToRad(360));

    /// 打钩
    // path.moveTo(x - radius / 2, y);
    // path.lineTo(x - radius / 6, y + len);
    // path.lineTo(x + radius * 1 / 2, y - radius * 1 / 3);
    //左边
    Path path1 = Path();
    path1.relativeMoveTo(x - radius / 2, y - radius / 2);
    path.relativeMoveTo(x + radius / 2, y + radius / 2);

    path.addPath(path1, Offset(x - radius / 2, y - radius / 2));
    // path.addRect(rect)
    // // path.lineTo(x - radius / 2, y + radius / 2);
    // // path.moveTo(x + radius / 2, y - radius / 2);
    Path path2 = Path();
    path.relativeMoveTo(x + radius / 2, y - radius / 2);
    path.relativeMoveTo(x - radius / 2, y + radius / 2);

    path.addPath(path2, Offset.zero);
    // path.close();
    canvas.drawPath(path, viewPaint);

    /// 路径动画
    PathMetrics pathMetrics = path.computeMetrics();

    /// 圆的路径
    PathMetric circularPathMetric = pathMetrics?.first;

    /// 第一个Path是圆、第二个Path是钩
    // if (progress <= 1) {
    //   Path circularExtractPath = circularPathMetric.extractPath(
    //     0.0,
    //     circularPathMetric.length * progress,
    //   );
    //   canvas.drawPath(circularExtractPath, viewPaint);
    // }
    // if (progress <= 2) {
    //   // / 画背景圆
    //   Path circularExtractPath = circularPathMetric.extractPath(
    //     0.0,
    //     circularPathMetric.length,
    //   );
    //   canvas.drawPath(circularExtractPath, viewPaint);
    //   print("长度---${pathMetrics.length}");

    //   /// 画钩
    //   // PathMetric tickPathMetric = pathMetrics?.elementAt(1);
    //   // Path tickExtractPath = tickPathMetric.extractPath(
    //   //   0.0,
    //   //   tickPathMetric.length * (progress - 1),
    //   // );
    //   // canvas.drawPath(tickExtractPath, viewPaint);
    // } else if (progress <= 3) {
    //   // / 画背景圆
    //   Path circularExtractPath = circularPathMetric.extractPath(
    //     0.0,
    //     circularPathMetric.length,
    //   );
    //   canvas.drawPath(circularExtractPath, viewPaint);

    //   // /// 画钩
    //   // PathMetric tickPathMetric = pathMetrics?.last;
    //   // Path tickExtractPath = tickPathMetric.extractPath(
    //   //   0.0,
    //   //   tickPathMetric.length * (progress - 2),
    //   // );
    //   // canvas.drawPath(tickExtractPath, viewPaint);
    // }
  }

  /// 如果绘制依赖外部状态，那么我们就应该在shouldRepaint中判断依赖的状态是否改变，
  /// 如果已改变则应返回true来重绘，反之则应返回false不需要重绘。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
