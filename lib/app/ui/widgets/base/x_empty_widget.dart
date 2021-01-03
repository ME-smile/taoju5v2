/*
 * @Description: 空视图
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:20:28
 * @LastEditTime: 2020-12-21 13:52:16
 */

import 'package:flutter/material.dart';
import 'package:taojuwu/app/type_defs/type_defs.dart';

class XEmptyWidget extends StatelessWidget {
  final FutureCallback retry;
  const XEmptyWidget({Key key, this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text("暂无数据"),
    );
  }
}
