/*
 * @Description: 网络配置
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:24:04
 * @LastEditTime: 2021-01-11 10:35:16
 */
import 'app_config.dart';

class NetConfig {
  //设别信息
  Map<String, dynamic> headers;

  // 网络请求过期时间,毫秒为单位
  int timeout;

  //为测试环境和生产环境配置不同的url
  static String get baseUrl =>
      AppConfig.isDebug ? 'http://buyi.taoju5.com' : 'http://106.14.219.213:80';

  NetConfig({this.headers, this.timeout = 5000 * 12});
}
