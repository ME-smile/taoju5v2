/*
 * @Description: 填写测装数据
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:20:33
 * @LastEditTime: 2021-01-17 17:34:05
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_sized_text_field.dart';

import 'edit_measure_data_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            SizedBox(
                height: 480.w,
                child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.asset(
                        AppConfig.assetImagePrefixPath + _.mainImg))),
            Row(
              children: [
                Text("宽(cm):"),
                XSizedTextField(
                  width: 256.w,
                ),
              ],
            ),
            Row(
              children: [
                Text("高(cm):"),
                XSizedTextField(
                  width: 256.w,
                ),
              ],
            ),
            Row(
              children: [
                Text("离地距离(cm):"),
                XSizedTextField(
                  width: 256.w,
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar:
            ElevatedButton(onPressed: _.setMeasureData, child: Text("确定")),
      );
    });
  }
}
