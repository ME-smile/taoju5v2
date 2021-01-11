/*
 * @Description: 搜索页面controller
 * @Author: iamsmiling
 * @Date: 2021-01-07 14:25:44
 * @LastEditTime: 2021-01-09 23:18:52
 */

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SearchType { customer, order, product }

class SearchController extends GetxController {
  ///[记录搜索历史和用户信息
  SharedPreferences _sp;

  Map<SearchType, List<String>> _searchHistory = {
    SearchType.customer: [],
    SearchType.order: [],
    SearchType.product: [],
  };

  Map<SearchType, String> _searchTip = {
    SearchType.customer: "搜索客户",
    SearchType.product: "搜索款号或关键词",
    SearchType.order: "搜索订单",
  };

  static const int MAX_LENGTH = 10;

  SearchType get type => Get.arguments;
  String get hintText => _searchTip[type];
  List<String> get historyList => _searchHistory[type]?.toSet()?.toList();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  void _init() async {
    _sp = await SharedPreferences.getInstance();
    _sync();
  }

  void addSearchItem(String data) {
    historyList.insert(0, data);

    _persist(type, historyList);

    ///刷新搜索记录
    update(["history"]);
  }

  void removeSearchItem(String data) {
    historyList.remove(data);
    _persist(type, historyList);

    ///刷新搜索记录
    update(["history"]);
  }

  ///同步数据到内存中
  void _sync() {
    _searchHistory[type] = _sp.getStringList(type.toString());

    ///刷新搜索记录
    update(["history"]);
  }

  ///数据持久化
  void _persist(SearchType type, List<String> data) {
    _sp.setStringList(type.toString(), data);
  }
}
