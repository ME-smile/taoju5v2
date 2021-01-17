/*
 * @Description:app
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:21:14
 * @LastEditTime: 2021-01-17 23:43:33
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';
import 'package:taojuwu/app/domain/repository/taojuwu/taojuwu_repository.dart';
import 'package:taojuwu/app/storage/taojuwu_storage.dart';

import 'package:taojuwu/app/utils/x_logger.dart';
// import 'package:taojuwu/app/ui/pages/home/taojuwu_data.dart';
import 'package:taojuwu/app/xdio/x_dio.dart';

class TaojuwuDataAccessor {
  ///空间
  final CurtainProductAttrModel room;

  ///窗纱
  final CurtainProductAttrModel gauze;

  TaojuwuDataAccessor({this.room, this.gauze});
}

class TaojuwuController extends GetxController {
  TaojuwuRepository _repository = TaojuwuRepository();

  Future _loadData() {
    return _repository.curtainProductAttrs().then((BaseResponse response) {
      if (response.isValid) {
        rootBundle
            .loadString("assets/data/curtain_mode.json")
            .then((String data) {
          Map json = jsonDecode(data)["data"];

          CurtainProductAttrModel room =
              CurtainProductAttrModel.fromType(1, json);
          CurtainProductAttrModel gauze =
              CurtainProductAttrModel.fromType(1, json);
          response.data.addAll(json);
          TaojuwuStorageAccessor().shopCurtainProductAttrs = response.data;
          XLogger.v(response.data);
        });
      }
    });
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
