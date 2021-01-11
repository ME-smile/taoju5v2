/*
 * @Description: 商品过滤页面
 * @Author: iamsmiling
 * @Date: 2020-12-25 16:28:08
 * @LastEditTime: 2021-01-10 17:38:40
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_filter_tag_model.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_controller.dart';
import 'package:taojuwu/app/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_check_button.dart';

class ProductListFilterPage extends StatelessWidget {
  const ProductListFilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .72,
      color: Theme.of(context).primaryColor,
      height: Get.height,
      child: Scaffold(
        body: GetBuilder<ProductListFilterController>(
            init: ProductListFilterController(),
            autoRemove: false,
            builder: (_) {
              return XLoadStateBuilder(
                  loadState: _.loadState,
                  builder: (BuildContext context) {
                    return Container(
                      child: ListView.builder(
                        itemCount: _.tagList?.length ?? 0,
                        itemBuilder: (BuildContext context, int i) {
                          ProductFilterTagModel tag = _.tagList[i];
                          return Column(
                            children: [
                              Text(tag.title),
                              GetBuilder<ProductListFilterController>(
                                id: tag.key,
                                builder: (_) {
                                  return Wrap(
                                    children: [
                                      for (ProductFilterTagOptionModel option
                                          in tag.options)
                                        XCheckButton(
                                            target: option,
                                            callback: () =>
                                                _.selectOption(tag, option),
                                            child: Text(option.name))
                                    ],
                                  );
                                },
                              )
                            ],
                          );
                        },
                      ),
                    );
                  });
            }),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: XDimens.gap32),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                          color: XColors.outlineBorderColor, width: .8)),
                      shape: MaterialStateProperty.all(BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero))),
                  onPressed: () {
                    final controller = Get.find<ProductListFilterController>();
                    controller.reset();
                  },
                  child: Text("重置"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero))),
                    onPressed: () {
                      final controller =
                          Get.find<ProductListFilterController>();
                      controller.confirm();
                    },
                    child: Text("确定")),
              )
            ],
          ),
        ),
        // Row(
        //   children: [
        //     OutlineButton(
        //       onPressed: () {
        //         final controller = Get.find<ProductListFilterController>();
        //         controller.reset();
        //       },
        //       child: Text("重置"),
        //     ),
        //     OutlineButton(
        //       onPressed: () {
        //         final controller = Get.find<ProductListFilterController>();
        //         controller.confirm();
        //       },
        //       child: Text("确定"),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
