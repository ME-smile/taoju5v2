/*
 * @Description: App相关配置
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:20:38
 * @LastEditTime: 2021-01-17 23:13:00
 */
enum AppMode {
  release,
  debug,
}

class AppConfig {
  // app名字
  static String get appName => isDebug ? '淘居屋商家测试版' : "淘居屋商家";

  static const String assetImagePrefixPath = "assets/images/";

  /// bugly相关
  static const buglyAndroidAppId = '0da7f235c9';
  static const buglyIosAppId = '9e3d92e673';

  /// 微信分享相关
  static const weChatAppId = 'wxd930ea5d5a258f4f';
  static const weCharShareUniversalLink = 'https://your.univerallink.com/link/';

  static AppMode mode = AppMode.debug;

  static bool get isDebug => mode == AppMode.debug;
}
