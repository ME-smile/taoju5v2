/*
 * @Description: app页面
 * @Author: iamsmiling
 * @Date: 2020-12-18 16:11:26
 * @LastEditTime: 2021-01-11 15:23:06
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/storage/storage_manager.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_address_edit/customer_address_edit_binding.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_address_edit/customer_address_eidt_page.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_binding.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_detail/customer_detail_page.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_edit/customer_edit_binding.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_edit/customer_edit_page.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_binding.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_list/customer_list_page.dart';
import 'package:taojuwu/app/ui/pages/dashboard/data_dash_board_binding.dart';
import 'package:taojuwu/app/ui/pages/dashboard/data_dash_board_page.dart';
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
import 'package:taojuwu/app/ui/pages/product/collection/collection_binding.dart';
import 'package:taojuwu/app/ui/pages/product/collection/collection_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_binding.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/subpage/measure_data/edit_measure_data_binding.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/subpage/measure_data/edit_measure_data_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/product_detail_binding_v2.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/product_detail_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/product_detail_page_v2.dart';

import 'package:taojuwu/app/ui/pages/product/product_detail_v2/subpage/product_quotation/product_quotation_binding.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail_v2/subpage/product_quotation/product_quotation_page.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/product_list_binding.dart';
import 'package:taojuwu/app/ui/pages/product/product_list/product_list_page.dart';
import 'package:taojuwu/app/ui/pages/product/scene_product_detail/scene_product_detail_binding.dart';
import 'package:taojuwu/app/ui/pages/product/scene_product_detail/scene_product_detail_page.dart';
import 'package:taojuwu/app/ui/pages/product/selectable_product_list/selectable_product_list_binding.dart';
import 'package:taojuwu/app/ui/pages/product/selectable_product_list/selectable_product_list_page.dart';
import 'package:taojuwu/app/ui/pages/product/soft_prodcut_detail/soft_product_detail_binding.dart';
import 'package:taojuwu/app/ui/pages/product/soft_prodcut_detail/soft_product_detail_page.dart';
import 'package:taojuwu/app/ui/pages/search/search_binding.dart';
import 'package:taojuwu/app/ui/pages/search/search_page.dart';
import 'package:taojuwu/app/ui/pages/setting/app_version/app_version_page.dart';
import 'package:taojuwu/app/ui/pages/setting/feed_back/feed_back_binding.dart';
import 'package:taojuwu/app/ui/pages/setting/feed_back/feed_back_page.dart';
import 'package:taojuwu/app/ui/pages/setting/setting/setting_binding.dart';
import 'package:taojuwu/app/ui/pages/setting/setting/setting_page.dart';
import 'package:taojuwu/app/ui/pages/user_protocol/user_protocol_page.dart';

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

    GetPage(
        name: AppRoutes.selectableProductList,
        page: () => SelectableProductListPage(),
        binding: SelectableProductListBinding()),

    ///改版后的商品详情
    GetPage(
        name: AppRoutes.productDetailV2 + "/:id",
        page: () => ProductDetailPageV2(),
        binding: ProductDetailBindingV2()),
    GetPage(
        name: AppRoutes.productQuotation,
        page: () => ProductQuotationPage(),
        binding: ProductQuotationBinding()),

    ///场景
    GetPage(
        name: AppRoutes.sceneProductDetail + "/:id",
        page: () => SceneProductDetailPage(),
        binding: SceneProductDetailBinding()),

    ///软装方案
    GetPage(
        name: AppRoutes.softProductDetail + "/:id",
        page: () => SoftProductDetailPage(),
        binding: SoftProductDetailBinding()),

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

    GetPage(
        name: AppRoutes.customerAddressEdit + "/:id",
        page: () => CustomerAddressEditPage(),
        binding: CustomerAddressEditBinding()),

    ///设置相关
    GetPage(
        name: AppRoutes.setting,
        page: () => SettingPage(),
        binding: SettngBinding()),
    GetPage(
        name: AppRoutes.feedback,
        page: () => FeedBackPage(),
        binding: FeedBackBinding()),

    ///数据中心
    GetPage(
        name: AppRoutes.dashBoard,
        page: () => DataDashBoardPage(),
        binding: DataDashBoardBinding()),

    ///搜索页面
    GetPage(
        name: AppRoutes.search,
        page: () => SearchPage(),
        binding: SeacrhBinding()),

    ///搜藏夹
    GetPage(
        name: AppRoutes.collection,
        page: () => CollectionPage(),
        binding: CollectionBinding()),

    ///用户协议
    GetPage(name: AppRoutes.userProtocol, page: () => UserProtocolPage()),

    ///app版本号
    GetPage(name: AppRoutes.appVersion, page: () => AppVersionPage())
  ];
}
