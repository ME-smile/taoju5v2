/*
 * @Description: 微信sdk
 * @Author: iamsmiling
 * @Date: 2021-01-17 18:10:41
 * @LastEditTime: 2021-01-17 23:02:38
 */
import 'package:fluwx/fluwx.dart';
import 'package:taojuwu/app/config/app_config.dart';

import '../i_sdk_initializer.dart';

class WeChatSdk implements ISdkInitializer {
  @override
  bool hasInited = false;

  @override
  void init() {
    hasInited = true;
    _init();
  }

  void _init() async {
    try {
      print("++++初始化微信sdk-----++++++++++++");
      await registerWxApi(
          appId: AppConfig.weChatAppId,
          universalLink: AppConfig.weCharShareUniversalLink);
    } catch (err) {
      print("++++初始化微信sdk失败!!!!!$err-----++++++++++++");
    }

    try {
      var result = await isWeChatInstalled;
      print("______$result");
      print("is installed $result");
    } catch (err) {
      print(err);
    }
  }

  @override
  void release() {
    hasInited = false;
  }
}
