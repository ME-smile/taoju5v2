/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:50:42
 * @LastEditTime: 2021-01-09 19:51:44
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/scene_product_detail/scene_product_detail_controller.dart';

class SceneProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SceneProductDetailController());
  }
}
