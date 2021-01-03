/*
 * @Description: 商品列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:28:50
 * @LastEditTime: 2020-12-31 18:01:30
 */

import 'package:taojuwu/app/domain/model/product/cart_product_model.dart';
import 'package:taojuwu/app/domain/model/product/product_detail_model.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/domain/provider/product/product_api.dart';
import 'package:taojuwu/app/xdio/x_dio.dart';

class ProductRepository {
  final ProductAPI _api = ProductAPI();

  Future<ProductModelListWrapper> productList({Map params}) {
    return _api
        .productList("/api/goods/goodsListByConditions", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return ProductModelListWrapper.fromJson(response.data);
      }
      throw Exception(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<ProductDetailModelWrapper> productDetail({Map params}) => _api
          .productDetail("/api/goods/goodsDetail", params: params)
          .then((BaseResponse response) {
        if (response.isValid) {
          return ProductDetailModelWrapper.fromJson(response.data);
        }
        throw Exception(response.message);
      }).catchError((err) {
        throw err;
      });

  Future cartList({Map params}) {
    return _api
        .cartList("/api/goods/cartList", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return CartPorductModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }
}
