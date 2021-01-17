/*
 * @Description: 弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-14 15:14:19
 * @LastEditTime: 2021-01-15 21:53:03
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_icons.dart';

class XBaseModal extends StatelessWidget {
  final WidgetBuilder builder;
  final Widget header;
  final Widget divider;
  final double height;
  const XBaseModal(
      {Key key,
      @required this.builder,
      this.header = const SizedBox.shrink(),
      this.divider = const SizedBox.shrink(),
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      child: Container(
        height: height ?? Get.height * .72,
        width: Get.width,
        color: Get.theme.primaryColor,
        child: Stack(
          children: [
            Column(
              children: [
                header,
                divider,
                Expanded(child: Builder(builder: builder))
              ],
            ),
            Positioned(
              child: IconButton(
                icon: Icon(XIcons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              top: 5,
              right: 5,
            )
          ],
        ),
      ),
    );
  }
}
