/*
 * @Description: 分享
 * @Author: iamsmiling
 * @Date: 2021-01-17 19:31:14
 * @LastEditTime: 2021-01-17 22:41:32
 */
import 'package:flutter/foundation.dart';
import 'package:fluwx/fluwx.dart';

class XShareModel {
  String description;
  String icon;
  Function onTap;

  XShareModel({this.description, this.icon, this.onTap});
}

class TaojuwuShareModel {
  WeChatShareWebPageModel sessionShareModel;
  WeChatShareWebPageModel momentShareModel;
  String url;
  String copyTip;

  TaojuwuShareModel(
      {@required this.sessionShareModel,
      @required this.momentShareModel,
      @required this.url,
      this.copyTip = "链接复制成功"});
}
