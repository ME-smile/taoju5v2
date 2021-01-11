/*
 * @Description: 顶部图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:14:27
 * @LastEditTime: 2021-01-09 19:36:18
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:taojuwu/app/ui/widgets/common/x_photo_viewer.dart';

class ProductDetailBannerCardV2 extends StatelessWidget {
  final List<String> imageList;
  const ProductDetailBannerCardV2({Key key, this.imageList}) : super(key: key);

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
