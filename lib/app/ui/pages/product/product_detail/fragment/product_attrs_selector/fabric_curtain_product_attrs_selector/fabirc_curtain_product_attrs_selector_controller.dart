/*
 * @Description: 布艺帘商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-23 10:00:01
 * @LastEditTime: 2020-12-31 09:55:37
 */

import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';

import '../base_curtain_product_attrs_selector_controller.dart';

class FabricCurtainProductAttrSelectorController
    extends BaseCurtainProductAttrsSelectorController {
  List<CurtainProductAttrModel> get attrList =>
      [room, gauze, craft, sectionalBar, valance, riboux, accessory];

  String get description =>
      "宽:$widthM米 高:$heightM米,${room.currentOptionName}、$style、";

  @override
  void initAttrs() {
    super.initAttrs();
  }

  @override
  void onInit() {
    initAttrs();
    super.onInit();
  }

  @override
  Map get storageData {
    return {
      "room": room.toJson(),
      "gauze": gauze.toJson(),
      "craft": craft.toJson(),
      "sectionalBar": sectionalBar.toJson(),
      "valance": valance.toJson(),
      "riboux": riboux.toJson(),
      "accessory": accessory.toJson(),
      "width": width,
      "height": height,
      "groundClearance": groundClearance,
      "windowBox": windowBox,
      "windowFacade": windowFacade,
      "windowBay": windowBay,
      "installMode": [],
      "openMode": []
    };
  }
}
