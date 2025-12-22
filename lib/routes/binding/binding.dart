import 'package:get/get.dart';
import 'package:product_cart_app/features/cart/controller/cart_controller.dart';
import 'package:product_cart_app/features/products/controller/product_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController(), fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
  }
}
