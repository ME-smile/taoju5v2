/*
 * @Description: 风格样式
 * @Author: iamsmiling
 * @Date: 2021-01-15 14:49:41
 * @LastEditTime: 2021-01-15 14:58:07
 */
import 'package:flutter/material.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';

class XTagChip extends StatelessWidget {
  final String tag;
  const XTagChip({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
          padding: EdgeInsets.symmetric(vertical: 2),
          backgroundColor: XColors.lightYellowColor,
          label: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: XColors.accentColor, shape: BoxShape.circle),
                child: Text(
                  "#",
                  style: TextStyle(
                      color: XColors.primaryColor, fontSize: XDimens.sp22),
                ),
              ),
              Text(
                tag,
                style: TextStyle(
                    color: XColors.accentColor, fontSize: XDimens.sp24),
              )
            ],
          )),
    );
  }
}
