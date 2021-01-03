/*
 * @Description: 详情图
 * @Author: iamsmiling
 * @Date: 2020-12-25 14:02:15
 * @LastEditTime: 2020-12-25 14:13:31
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taojuwu/app/ui/widgets/common/x_photo_viewer.dart';

class ProductDetailImageSectionView extends GetView<ProductDetailController> {
  List<String> get imageList => controller.detailModel.detailImgList;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(imageList),
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            return XPhotoViewer(url: imageList[i]);
          },
          itemCount: imageList.length,
        ),
      ),
    );
  }
}
