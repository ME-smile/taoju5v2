/*
 * @Description: editmeasuredatabinding
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:27:28
 * @LastEditTime: 2020-12-24 10:29:26
 */

import 'package:get/get.dart';

import 'edit_measure_data_controller.dart';

class EditMeasureDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditMeasureDataController());
  }
}
