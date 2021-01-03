/*
 * @Description: 商品价格计算代理
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:43:03
 * @LastEditTime: 2020-12-25 14:25:14
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/fabric_curtain_product_attrs_selector/fabirc_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/rolling_curtain_product_attrs_selector/rolling_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';

import 'package:taojuwu/app/utils/common_kit.dart';
import 'fragment/product_attrs_selector/gauze_curtain_product_attrs_selector/gauze_curtain_peoduct_attrs_controller.dart';

class BasePoductPriceDelegatorController extends GetxController {
  final BasePoductPriceDelegator delegator;

  BasePoductPriceDelegatorController() : delegator = BasePoductPriceDelegator();
}

///对于成品只需要商品模型即可
class BasePoductPriceDelegator {
  ///商品
  ProductDetailModel product = Get.find<ProductDetailController>().detailModel;

  ///[unitPrice]商品单价
  double get unitPrice => product.price;

  ///总价
  double get totalPrice => 0;
}

///对于窗帘 还需要商品属性 商品宽高
abstract class BaseCurtainProuctPriceDelegator<
        T extends BaseCurtainProductAttrsSelectorController>
    extends BasePoductPriceDelegator {
  T get controller;

  double get widthM => controller.widthM;

  double get heightM => controller.heightM;

  double get heightCM => controller.heightCM;

  double get area {
    double _area = widthM * heightM;
    return _area > 0
        ? _area < 1
            ? 1
            : _area
        : 0;
  }

  ///定高情况下最高为276
  double maxHeight = 276;

  ///[foldingFactor]褶皱系数:至于什么是褶皱系数 我也不知道
  double foldingFactor = 2.0;

  ///窗纱的价格
  double get gauzePrice => controller?.gauze?.currentOptionPrice;

  ///配饰的价格
  double get accessoryPrice => controller?.accessory?.currentOptionPrice;

  ///型材的价格
  double get sectionalBarPrice => controller?.sectionalBar?.currentOptionPrice;

  ///里布的价格
  double get ribouxPrice => controller?.riboux?.currentOptionPrice;

  ///幔头的价格
  double get valancePrice => controller?.valance?.currentOptionPrice;

  bool get hasGauze => controller?.hasGauze;
}

///布艺帘价格计算
class FabricCurtainProductPriceDelegator
    extends BaseCurtainProuctPriceDelegator {
  FabricCurtainProductAttrSelectorController get controller =>
      Get.find<FabricCurtainProductAttrSelectorController>();

//窗帘主布高度因子
  double get mainHeightFactor {
    double factor = 1.0;
    if (CommonKit.isNullOrZero(heightCM)) return factor;
    if (heightCM > maxHeight && product.isCustomSize) {
      factor = (widthM + heightM - 2.65) / widthM;
    }
    return factor;
  }

  // 窗帘高度因子2
  double get heightFactor {
    if (CommonKit.isNullOrZero(heightCM)) return 1.0;
    return heightCM > maxHeight ? 1.5 : 1.0;
  }

  ///[mainCurtainClothPrice]窗帘主布价格
  double get mainCurtainClothPrice {
    ///窗帘定高计算
    if (product.isFixedHeight) {
      return widthM * foldingFactor * heightFactor * unitPrice;
    }

    ///窗帘定宽计算
    if (product.isFixedWidth) {
      ///如果窗帘定宽且拼花
      if (product.hasFlower) {
        return unitPrice *
            ((widthM * foldingFactor / product.doorWidth).ceil() *
                ((heightM + 0.2) / product.flowerSize).ceil() *
                product.flowerSize);
      }

      ///如果窗帘定宽但不拼花
      return unitPrice *
          ((widthM * foldingFactor / product.doorWidth).ceil() *
              ((heightM + 0.2)));
    }

    ///自定义宽高
    return widthM * foldingFactor * mainHeightFactor * unitPrice;
  }

  @override
  double get totalPrice {
    double tmp = unitPrice;

    ///如果有窗纱
    if (hasGauze) {
      tmp = mainCurtainClothPrice +
          (ribouxPrice + gauzePrice) * foldingFactor * widthM * heightFactor +
          valancePrice * widthM +
          sectionalBarPrice * widthM * foldingFactor +
          accessoryPrice;
    }

    ///没有窗纱
    else {
      tmp = mainCurtainClothPrice +
          (ribouxPrice + gauzePrice) * foldingFactor * widthM * heightFactor +
          valancePrice * widthM +
          sectionalBarPrice * widthM +
          accessoryPrice;
    }

    return tmp;
  }
}

class RollingCurtainProductPriceDelegator
    extends BaseCurtainProuctPriceDelegator {
  @override
  double get totalPrice => unitPrice * area;

  @override
  get controller => Get.find<RollingCurtainProductAttrsSelectorController>();
}

class GauzeCurtainProductPriceDelegator
    extends BaseCurtainProuctPriceDelegator {
  @override
  double get totalPrice {
    double tmp = unitPrice;
    double heightFactor = 1.0;
    double mainHeightFactor = 1.0;

    if (heightCM != null && heightCM > 270) {
      heightFactor = 1.5;
      if (!product.isFixedHeight) {
        mainHeightFactor = (widthM + heightM - 2.65) / widthM;
      }
      tmp = unitPrice * widthM * mainHeightFactor * foldingFactor +
          gauzePrice * foldingFactor * widthM * heightFactor +
          sectionalBarPrice * widthM +
          accessoryPrice;
    }
    return tmp;
  }

  @override
  get controller => Get.find<GauzeCurtainProductAttrsSelectorController>();
}
