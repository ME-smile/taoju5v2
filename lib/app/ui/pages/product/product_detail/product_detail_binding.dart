/*
 * @Description: productDetailBinding
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:42:56
 * @LastEditTime: 2020-12-25 14:25:26
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/fabric_curtain_product_attrs_selector/fabirc_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/gauze_curtain_product_attrs_selector/gauze_curtain_peoduct_attrs_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/rolling_curtain_product_attrs_selector/rolling_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductDetailController(int.tryParse(Get.parameters["id"])),
    );

    ///布艺帘
    Get.lazyPut(() => FabricCurtainProductAttrSelectorController());

    ///窗纱
    Get.lazyPut(() => GauzeCurtainProductAttrsSelectorController());

    ///卷帘
    Get.lazyPut(() => RollingCurtainProductAttrsSelectorController());
  }
}
