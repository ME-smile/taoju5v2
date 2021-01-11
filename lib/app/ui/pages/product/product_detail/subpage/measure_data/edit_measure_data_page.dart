/*
 * @Description: 填写测装数据
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:20:33
 * @LastEditTime: 2021-01-07 13:30:41
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';

import 'edit_measure_data_controller.dart';

class EditMeasureDataPage extends StatelessWidget {
  const EditMeasureDataPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditMeasureDataController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("测装数据"),
        ),
        body: Column(
          children: [
            Image.asset(AppConfig.assetImagePrefixPath + _.mainImg),
            TextFormField(
              initialValue: _.width,
              onChanged: (String text) {
                _.width = text;
              },
            ),
            TextFormField(
              initialValue: _.height,
              onChanged: (String text) {
                _.height = text;
              },
            ),
            TextFormField(
              initialValue: _.groundClearance,
              onChanged: (String text) {
                _.groundClearance = text;
              },
            ),
          ],
        ),
        bottomNavigationBar:
            ElevatedButton(onPressed: _.setMeasureData, child: Text("确定")),
      );
    });
  }
}
