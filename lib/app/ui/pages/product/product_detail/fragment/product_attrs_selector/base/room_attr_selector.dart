/*
 * @Description: 空间选择器
 * @Author: iamsmiling
 * @Date: 2021-01-17 17:38:08
 * @LastEditTime: 2021-01-17 17:39:58
 */
import 'package:flutter/material.dart';
import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_selector_text_field.dart';

class RoomAttrSelector extends StatelessWidget {
  final CurtainProductAttrModel room;
  const RoomAttrSelector({Key key, @required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: XSelectorTextField(
        label: Text(room.typeName),
        onFuture: () {},
      ),
    );
  }
}
