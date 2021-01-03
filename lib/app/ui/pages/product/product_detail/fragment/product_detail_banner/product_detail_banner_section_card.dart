/*
 * @Description: 顶部图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:14:27
 * @LastEditTime: 2020-12-23 17:19:07
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/widgets/common/x_photo_viewer.dart';

class ProductDetailBannerCard extends GetView<ProductDetailController> {
  const ProductDetailBannerCard({Key key}) : super(key: key);

  List<String> get imageList => controller?.detailModel?.imgList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: Swiper(
        itemCount: imageList?.length,
        itemBuilder: (BuildContext context, int index) {
          return XPhotoViewer(url: imageList[index]);
        },
        loop: false,
        pagination: new SwiperPagination(
            margin: EdgeInsets.symmetric(horizontal: 5),
            builder: DotSwiperPaginationBuilder(
                size: 8.0,
                activeSize: 8.0,
                activeColor:
                    imageList.length > 0 ? Colors.transparent : Colors.black,
                color: Colors.black.withOpacity(.3))),
      ),
    );
  }
}
