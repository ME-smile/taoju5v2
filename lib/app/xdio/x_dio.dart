/*
 * @Description: 基于dio的二次封装
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:34:12
 * @LastEditTime: 2021-01-17 11:45:10
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:taojuwu/app/config/net_config.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';
import 'package:taojuwu/app/utils/json_kit.dart';
import 'package:taojuwu/app/utils/x_logger.dart';

class XDio {
  // 私有构造函数
  // netconfig 网络配置相关
  NetConfig netConfig;
  // dio 实例
  Dio dio;

  XDio._internal() {
    netConfig = NetConfig(headers: {});
    String token = StorageManager().sharedPreferences.getString("token");
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: NetConfig.baseUrl,
          queryParameters: {"token": token},
          connectTimeout: netConfig.timeout,
          receiveTimeout: netConfig.timeout)
      ..interceptors.add(InterceptorsWrapper(
        onError: (DioError error) {
          return error;
        },
        onRequest: ((RequestOptions options) {
          print(
              "--------------请求地址----------------\n:${options.baseUrl + options.path}");
          XLogger.v(
              "====================query请求参数===========================\n${options.queryParameters}");
          XLogger.v(
              "+++++++++++++++++++++++++formData参数+++++++++++++++++++++++++\n${options.data}");
          return options;
        }),
        onResponse: (Response response) {
          response.data = jsonDecode(response.toString());
          XLogger.e(
              "*******************************请求结果*******************************\n${response.data}");
          return response;
        },
      ))
      ..interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: NetConfig.baseUrl)).interceptor);
  }
  static XDio _singleton = XDio._internal();
  factory XDio() => _singleton;

  Future<BaseResponse> get<T>(String url, {Map params, Options options}) async {
    Response response = await dio.get<T>(url,
        queryParameters: params?.cast<String, dynamic>(), options: options);
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> post<T>(String url,
      {Map queryParameters, Map formData, Options options}) async {
    Response response = await dio.post<T>(url,
        queryParameters: queryParameters?.cast<String, dynamic>(),
        options: options,
        data: formData?.cast<String, dynamic>());
    return BaseResponse.fromJson(response.data);
  }

  ///刷新token
  void refreshToken(String token) {
    dio.options.queryParameters = {"token": token};
  }
}

class BaseResponse {
  int code;
  dynamic data;
  String message;

  bool get isValid => code == 0;

  BaseResponse.fromJson(Map json) {
    code = JsonKit.asInt(json['code']);
    data = json['data'];
    message = json['message'];
  }
}
