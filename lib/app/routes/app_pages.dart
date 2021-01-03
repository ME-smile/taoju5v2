/*
 * @Description: app页面
 * @Author: iamsmiling
 * @Date: 2020-12-18 16:11:26
 * @LastEditTime: 2020-12-29 17:40:13
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_binding.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_page.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_edit/customer_edit_binding.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_edit/customer_edit_page.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_binding.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_page.dart';
import 'package:taojuwu/app/ui/pages/home/home_page.dart';
import 'package:taojuwu/app/ui/pages/login/login/login_binding.dart';
import 'package:taojuwu/app/ui/pages/login/login/login_page.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_binding.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_page.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_binding.dart';
import 'package:taojuwu/app/ui/pages/order/order_detail/order_detail_page.dart';
import 'package:taojuwu/app/ui/pages/order/order_list/order_list_binding.dart';
import 'package:taojuwu/app/ui/pages/order/order_list/order_list_page.dart';
import 'package:taojuwu/app/ui/pages/product/cart/cart_binding.dart';
import 'package:taojuwu/app/ui/pages/product/cart/cart_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_binding.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/sub_page/measure_data/edit_measure_data_binding.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/sub_page/measure_data/edit_measure_data_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/product_list_binding.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/product_list_page.dart';
import 'package:taojuwu/app/ui/pages/setting/setting/setting_binding.dart';
import 'package:taojuwu/app/ui/pages/setting/setting/setting_page.dart';

part 'app_routes.dart';

class AppPages {
  static get initial => GetUtils.isNullOrBlank(
          StorageManager().sharedPreferences.getString("token"))
      ? AppRoutes.login
      : AppRoutes.home;

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),

    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),

    ///商品相关
    GetPage(
        name: AppRoutes.productList,
        page: () => ProductListPage(),
        binding: ProductListBinding()),
    GetPage(
      name: AppRoutes.productDetail + "/:id",
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),

    ///购物车页面
    GetPage(
        name: AppRoutes.cart, page: () => CartPage(), binding: CartBinding()),

    ///填写测装数据
    GetPage(
        name: AppRoutes.editMeasureData,
        page: () => EditMeasureDataPage(),
        binding: EditMeasureDataBinding()),

    ///客户相关
    GetPage(
        name: AppRoutes.customerList,
        page: () => CustomerListPage(),
        binding: CustomerListBinding()),
    GetPage(
        name: AppRoutes.customerDetail + "/:id",
        page: () => CustomerDetailPage(),
        binding: CustomerDetailBinding()),
    GetPage(
        name: AppRoutes.customerEdit,
        page: () => CustomerEditPage(),
        binding: CustomerEditBinding()),

    ///订单相关
    GetPage(
        name: AppRoutes.orderList,
        page: () => OrderListPage(),
        binding: OrderListBinding()),

    GetPage(
        name: AppRoutes.orderDetail + "/:id",
        page: () => OrderDetailPage(),
        binding: OrderDetailBinding()),

    GetPage(
        name: AppRoutes.commitOrder,
        page: () => CommitOrderPage(),
        binding: CommitOrderBinding()),

    ///设置相关
    GetPage(
        name: AppRoutes.setting,
        page: () => SettingPage(),
        binding: SettngBinding()),
  ];
}
