/*
 * @Description: 空间属性选择器
 * @Author: iamsmiling
 * @Date: 2021-01-17 17:46:23
 * @LastEditTime: 2021-01-17 17:48:12
 */
import 'package:flutter/material.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_selector_text_field.dart';

class RoomAttrBar extends StatelessWidget {
  const RoomAttrBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XSelectorTextField(label: Text("空间"), onFuture: null);
  }
}
