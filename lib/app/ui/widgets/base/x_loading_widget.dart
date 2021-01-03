/*
 * @Description: 加载中
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:18:22
 * @LastEditTime: 2020-12-21 14:09:45
 */

import 'package:flutter/material.dart';

class XLoadingWidget extends StatelessWidget {
  const XLoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Text("加载中"),
      ),
    );
  }
}
