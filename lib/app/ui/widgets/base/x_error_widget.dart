/*
 * @Description: 网络错误
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:19:30
 * @LastEditTime: 2020-12-21 14:09:59
 */

import 'package:flutter/material.dart';
import 'package:taojuwu/app/type_defs/type_defs.dart';

class XErrorWidget extends StatelessWidget {
  final FutureCallback retry;
  const XErrorWidget({Key key, this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: retry,
      child: Material(
        child: Text("网络错误"),
      ),
    );
  }
}
