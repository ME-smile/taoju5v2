/*
 * @Description: App相关配置
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:20:38
 * @LastEditTime: 2020-12-25 14:57:06
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

  static AppMode mode = AppMode.debug;

  static bool get isDebug => mode == AppMode.debug;
}
