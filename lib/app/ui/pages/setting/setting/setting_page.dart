/*
 * @Description: 设置页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:53:48
 * @LastEditTime: 2020-12-29 17:35:23
 */
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/ui/pages/setting/setting/setting_controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: GetBuilder<SettingController>(builder: (_) {
        return Column(
          children: [
            Text(_.toString()),
            TextButton(onPressed: _.logOut, child: Text("退出"))
          ],
        );
      }),
    );
  }
}
