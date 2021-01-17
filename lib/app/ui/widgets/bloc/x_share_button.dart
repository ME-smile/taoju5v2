/*
 * @Description: 分享按钮
 * @Author: iamsmiling
 * @Date: 2021-01-15 15:24:50
 * @LastEditTime: 2021-01-15 15:26:52
 */
import 'package:flutter/material.dart';
import 'package:taojuwu/app/config/app_config.dart';

class XShareButton extends StatelessWidget {
  const XShareButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset(AppConfig.assetImagePrefixPath + "share.png"),
        onPressed: () {});
  }
}
