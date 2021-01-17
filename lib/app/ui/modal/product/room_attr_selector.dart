/*
 * @Description: 空间选择器
 * @Author: iamsmiling
 * @Date: 2021-01-17 17:40:32
 * @LastEditTime: 2021-01-17 17:43:33
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taojuwu/app/ui/modal/base/x_base_modal.dart';

Future showRoomAttrSelectorModal(BuildContext context) {
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return XBaseModal(builder: (BuildContext context) {
          return Text("空间选择器");
        });
      });
}
