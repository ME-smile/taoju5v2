/*
 * @Description: 分享按钮
 * @Author: iamsmiling
 * @Date: 2021-01-15 15:24:50
 * @LastEditTime: 2021-01-17 22:50:50
 */
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/domain/share/taojuwu_share_model.dart';
import 'package:taojuwu/app/ui/modal/share/share.dart';

class XShareButton extends StatelessWidget {
  final String url;
  const XShareButton({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset(AppConfig.assetImagePrefixPath + "share.png"),
        onPressed: () => showShareModal(context,
            shareModel: TaojuwuShareModel(
                sessionShareModel: WeChatShareWebPageModel(url),
                momentShareModel:
                    WeChatShareWebPageModel(url, scene: WeChatScene.TIMELINE),
                url: url)));
  }
}
