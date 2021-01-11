/*
 * @Description: 客户详情金刚区
 * @Author: iamsmiling
 * @Date: 2021-01-07 16:51:24
 * @LastEditTime: 2021-01-07 17:06:19
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/config/app_config.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_controller.dart';

class _CustomerDetailKongoModel {
  String icon;
  String title;
  Function onTap;

  _CustomerDetailKongoModel({this.icon, this.title, this.onTap});
}

class CustomerDetailKongo extends StatelessWidget {
  const CustomerDetailKongo({Key key}) : super(key: key);

  get id => Get.find<CustomerDetailController>().customer.id;
  static List<_CustomerDetailKongoModel> list = [
    _CustomerDetailKongoModel(
        icon: "customer_collection.png", title: "收藏夹", onTap: () {}),
    _CustomerDetailKongoModel(
        icon: "customer_cart.png", title: "购物车", onTap: () {}),
    _CustomerDetailKongoModel(
        icon: "customer_order.png", title: "订单", onTap: () {}),
    _CustomerDetailKongoModel(
        icon: "customer_cart.png", title: "退款/售后", onTap: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: XDimens.gap32, vertical: XDimens.gap48),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Color(0x1F000000),
              spreadRadius: 1.0,
              blurRadius: 1,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (_CustomerDetailKongoModel kongo in list)
            GestureDetector(
              onTap: kongo.onTap,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: XDimens.gap16),
                    child: Image.asset(
                        AppConfig.assetImagePrefixPath + kongo.icon),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: XDimens.gap16),
                    child: Text(kongo.title),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
