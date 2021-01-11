/*
 * @Description: 产品搭配
 * @Author: iamsmiling
 * @Date: 2021-01-08 16:54:18
 * @LastEditTime: 2021-01-09 19:45:37
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_model.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/res/x_icons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/routes/app_pages.dart';

class ProductMixSection extends StatelessWidget {
  final List<ProductModel> productList;
  const ProductMixSection({Key key, this.productList = const []})
      : super(key: key);

  int get len => productList.length;
  //共有多少组
  int get groupCount {
    int mod = len % 3;
    int div = len ~/ 3;
    return mod > 0 ? div + 1 : div;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(
              horizontal: XDimens.gap16, vertical: XDimens.gap16),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("搭配精选",
                        style: TextStyle(
                            fontSize: XDimens.sp28,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Text("查看全部"),
                    Icon(XIcons.next),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: XDimens.gap24),
                height: 180.h,
                child: Swiper(
                    itemCount: groupCount,
                    pagination: new SwiperPagination(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        builder: DotSwiperPaginationBuilder(
                            size: 6.0,
                            activeSize: 6.0,
                            activeColor: Colors.black,
                            color: Colors.black.withOpacity(.3))),
                    itemBuilder: (BuildContext context, int i) {
                      List<ProductModel> list = productList.sublist(i, i + 3);
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (ProductModel e in list)
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                        AppRoutes.productDetailV2 + "/${e.id}"),
                                    child: SizedBox(
                                      height: 160.h,
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: Image.network(
                                          e.image,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ],
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
