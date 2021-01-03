/*
 * @Description: 窗纱商品
 * @Author: iamsmiling
 * @Date: 2020-12-23 13:47:49
 * @LastEditTime: 2020-12-30 17:47:29
 */
import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';

class GauzeCurtainProductAttrsSelectorController
    extends BaseCurtainProductAttrsSelectorController {
  ///空间属性
  CurtainProductAttrModel room;

  ///窗纱
  // CurtainProductAttrModel gauze;

  ///工艺
  CurtainProductAttrModel craft;

  ///型材
  CurtainProductAttrModel sectionalBar;

  ///配饰
  CurtainProductAttrModel accessory;

  List<CurtainProductAttrModel> get attrList =>
      [room, craft, sectionalBar, accessory];

  @override
  void initAttrs() {
    super.initAttrs();
    room = CurtainProductAttrModel.fromType(1, json);
    // gauze = CurtainProductAttrModel.fromType(3, json);
    craft = CurtainProductAttrModel.fromType(4, json);
    sectionalBar = CurtainProductAttrModel.fromType(5, json);
    accessory = CurtainProductAttrModel.fromType(13, json, isMultiple: true);
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
      "craft": craft.toJson(),
      "sectionalBar": sectionalBar.toJson(),
      "accessory": accessory.toJson(),
      "width": width,
      "height": height,
      "groundClearance": groundClearance,
      "windowBox": windowBox,
      "windowFacade": windowFacade,
      "windowBay": windowBay,
    };
  }

  @override
  String get description => "";
}
