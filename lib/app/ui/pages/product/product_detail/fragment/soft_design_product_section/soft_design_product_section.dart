/*
 * @Description: 软装方案
 * @Author: iamsmiling
 * @Date: 2021-01-08 17:25:41
 * @LastEditTime: 2021-01-09 23:25:54
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/design_product_model.dart';
import 'package:taojuwu/app/res/x_icons.dart';

class SoftDesignProductSection extends StatelessWidget {
  final List<DesignProductModel> productList;
  const SoftDesignProductSection({Key key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("软装方案"),
                Spacer(),
                Text("查看更多"),
                Icon(XIcons.next)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
