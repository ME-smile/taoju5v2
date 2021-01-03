/*
 * @Description: 商品排序
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:13:39
 * @LastEditTime: 2020-12-25 15:47:36
 */

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_sort_model.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_sorter/product_list_sorter_controller.dart';

class ProductListSorterPanel extends StatelessWidget {
  const ProductListSorterPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 240.h,
        child: GetBuilder<ProductListSorterController>(
          init: ProductListSorterController(),
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (ProductSortModel model in _.sortModelList)
                  GestureDetector(
                    onTap: () => _.sort(model),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(model.name),
                        Container(
                          child: Icon(
                            XIcons.check,
                            color: model.isChecked ? null : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
