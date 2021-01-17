/*
 * @Description: 购物车按钮
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:29:34
 * @LastEditTime: 2020-12-23 17:37:52
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/storage/taojuwu_storage.dart';

class _XCartButtonController extends GetxController {
  String id;

  @override
  void onInit() {
    TaojuwuStorageAccessor accessor = TaojuwuStorageAccessor();
    id = accessor.customer.id;
    super.onInit();
  }
}

class XCartButton extends StatelessWidget {
  final String imageUrl;
  const XCartButton({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_XCartButtonController>(builder: (_) {
      return Image.asset(imageUrl);
    });
  }
}
