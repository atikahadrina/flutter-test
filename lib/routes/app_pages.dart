import 'package:get/get.dart';
import 'package:product_cart_app/features/cart/widget/cart_page.dart';
import 'package:product_cart_app/features/home/page/home_page.dart';
import 'package:product_cart_app/features/home/page/landing_page.dart';
import 'package:product_cart_app/features/products/widget/product_details_page.dart';
import 'package:product_cart_app/routes/app_routes.dart';

class AppPages {
  static final pageList = [
    GetPage(
      name: AppRoutes.landingPage,
      page: () {
        return const LandingPage();
      },
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () {
        return const HomePage();
      },
    ),
    GetPage(
      name: AppRoutes.productDetailsPage,
      page: () {
        return const ProductDetailsPage();
      },
    ),
    GetPage(
      name: AppRoutes.cartPage,
      page: () {
        return const CartPage();
      },
    ),
  ];
}
