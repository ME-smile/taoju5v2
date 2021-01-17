/*
 * @Description: 首页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:19:50
 * @LastEditTime: 2021-01-12 10:24:00
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/home/fragment/home_page_body.dart';
import 'package:taojuwu/app/ui/pages/home/fragment/home_page_header.dart';
import 'package:taojuwu/app/ui/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [HomePageHeader(), HomePageBody()],
        ),
      ),
    );
  }
}
