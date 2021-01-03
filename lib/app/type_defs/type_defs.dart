/*
 * @Description: 别名类型定义
 * @Author: iamsmiling
 * @Date: 2020-12-17 10:37:03
 * @LastEditTime: 2020-12-17 13:43:01
 */

/// 返回future的回调函数
/// [params] 可选位置参数 以数组方式传入
/// [return] future
typedef FutureCallback<T> = Future<T> Function();
