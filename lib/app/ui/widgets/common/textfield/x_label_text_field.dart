/*
 * @Description:带label的标签
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:29:28
 * @LastEditTime: 2021-01-07 21:15:09
 */

import 'package:flutter/material.dart';

class XLabelTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final TextEditingController controller;
  final TextStyle labelStyle;
  const XLabelTextField(
      {Key key,
      @required this.label,
      this.initialValue,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.controller,
      this.labelStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            label,
            style: labelStyle,
          ),
          Flexible(
              child: TextFormField(
                  initialValue: initialValue,
                  controller: controller,
                  onChanged: onChanged,
                  onFieldSubmitted: onSubmitted,
                  onEditingComplete: onEditingComplete)),
        ],
      ),
    );
    // return Container(
    //   child: Stack(
    //     alignment: Alignment.centerLeft,
    //     children: [
    //       Positioned.fill(
    //         child: FittedBox(
    //           fit: BoxFit.contain,
    //           alignment: Alignment.centerLeft,
    //           child: Container(
    //             child: Text(label),
    //           ),
    //         ),
    //         left: 0,
    //       ),
    //       TextFormField(),
    //     ],
    //   ),
    // );
  }
}
