/*
 * @Description: 排序控制器
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:31:23
 * @LastEditTime: 2020-12-25 15:53:22
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/product/product_sort_model.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/product_list_controller.dart';

class ProductListSorterController extends GetxController {
  ///商品排序模型

  List<ProductSortModel> sortModelList = [
    ProductSortModel(id: 1, name: "默认排序", isChecked: true),
    ProductSortModel(id: 2, name: "新品优先", order: "is_new", sort: "desc"),
    ProductSortModel(id: 3, name: "销量排序", order: "sales", sort: "desc"),
    ProductSortModel(id: 4, name: "价格升序", order: "price", sort: "asc"),
    ProductSortModel(id: 5, name: "价格降序", order: "price", sort: "desc"),
  ];
  final productListSorterController = Get.find<ProductListController>();
  @override
  void onInit() {
    _select(productListSorterController.sortModel);
    super.onInit();
  }

  _select(ProductSortModel model) {
    sortModelList.forEach((e) {
      e.isChecked = e.id == model.id;
    });
  }

  sort(ProductSortModel model) {
    _select(model);

    ///刷新面板内容
    update();

    ///刷新排序
    productListSorterController.sortModel = model;
    productListSorterController.update(["sort"]);
    // productListSorterController.refresh();
    Get.back();
  }
}
