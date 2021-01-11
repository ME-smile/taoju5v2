/*
 * @Description: eidtMeasureDataController
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:26:13
 * @LastEditTime: 2020-12-28 10:38:03
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';
import 'package:taojuwu/app/storage/taojuwu_storage.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/fabric_curtain_product_attrs_selector/fabirc_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_key.dart';

class MeasureDataNecessaryOption {
  CurtainProductAttrModel room;
  CurtainProductAttrModel windowBox;
}

class EditMeasureDataController extends GetxController {
  TextEditingController widthController;

  TextEditingController heightController;

  TextEditingController groundClearanceController;

  BaseCurtainProductAttrsSelectorController selectorController;

  String width;

  String height;

  String groundClearance;

  ///获取当前的模式
  CurtainModeAttrModel get currentMode {
    List<CurtainModeAttrModel> list = selectorController.modeList;
    return list.firstWhere(
        (e) => RegExp(selectorController.style).hasMatch(e.name),
        orElse: () => getFirstElement(list));
  }

  ///当前的安装方式
  CurtainInstallModeOptionModel get currentInstallMode {
    List<CurtainInstallModeOptionModel> list =
        currentMode.installModeOptionList;
    return list.firstWhere((e) => e.isChecked,
        orElse: () => getFirstElement(list));
  }

  ///获取当前的打开方式
  CurtainOpenModeModel get currentOpenMode {
    List<CurtainOpenModeModel> list = currentMode.openModeOptionList;
    return list.firstWhere((e) => e.isChecked,
        orElse: () => getFirstElement(list));
  }

  ///获取当前打开方式的子选项 页面展示
  List<CurtainSubOpenModeModel> get currentSubOpenModeOptionList =>
      currentOpenMode.optionList;

  // ///获取选中的子打开方式
  // CurtainSubOpenModeOptionModel get currentSubOpenModeOption {

  //   return currentSubOpenModeOptionList.firstWhere((e) => e.isChecked,orElse:()=>getFirstElement(currentSubOpenModeOptionList) )
  // }

  /// 主图
  String get mainImg => currentInstallMode.img;

  getFirstElement(List list) {
    if (GetUtils.isNullOrBlank(list)) return null;
    return list.first;
  }

  @override
  void onInit() {
    selectorController = Get.find<FabricCurtainProductAttrSelectorController>();
    width = selectorController.width;
    height = selectorController.height;
    widthController = TextEditingController();
    heightController = TextEditingController();
    groundClearanceController = TextEditingController();
    super.onInit();
  }

  setMeasureData() {
    selectorController.width = width;
    selectorController.height = height;

    ///更新总价
    Get.find<ProductDetailController>().update([ProductKey.totalPrice]);

    ///保存数据
    FabricCurtainProductAttrSelectorController controller =
        Get.find<FabricCurtainProductAttrSelectorController>();

    ///更新尺寸数据
    controller.update([ProductKey.size]);
    saveData(controller.storageData);
    Get.back();
  }

  saveData(Map data) {
    TaojuwuStorageAccessor accessor = TaojuwuStorageAccessor();
    accessor.curtainProductAttrData = data;
  }

  @override
  void onClose() {
    widthController.dispose();
    heightController.dispose();
    groundClearanceController.dispose();
    super.onClose();
  }
}
