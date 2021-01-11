/*
 * @Description: 搜索页面
 * @Author: iamsmiling
 * @Date: 2021-01-07 14:25:23
 * @LastEditTime: 2021-01-09 23:18:37
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/search/search_controller.dart';
import 'package:taojuwu/app/ui/widgets/common/x_search_bar.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XSearchBar(
        onSearch: controller.addSearchItem,
        hintText: controller.hintText,
      ),
      body: GetBuilder<SearchController>(
        id: "history",
        builder: (_) {
          return Visibility(
            visible: !GetUtils.isNullOrBlank(_.historyList),
            child: Wrap(
              children: [
                for (String e in _.historyList)
                  Chip(
                      label: Text(e),
                      onDeleted: () {
                        controller.removeSearchItem(e);
                      })
              ],
            ),
          );
        },
      ),
    );
  }
}
