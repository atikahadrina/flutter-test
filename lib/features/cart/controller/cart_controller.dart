import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:product_cart_app/components/preferences.dart';
import 'package:product_cart_app/features/cart/model/cart_model.dart';
import 'package:product_cart_app/features/products/model/product_model.dart';

class CartController extends GetxController {
  final items = <Item>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart() async {
    isLoading.value = true;
    final List<String>? storedItems = Preference.getStringList(Preference.cart);

    if (storedItems != null && storedItems.isNotEmpty) {
      final List<Item> itemsInCart = storedItems
          .map((item) => Item.fromJson(json.decode(item)))
          .toList();
      items.assignAll(itemsInCart);
    } else {
      items.clear();
    }

    isLoading.value = false;
    update();
  }

  Future<void> addToCart(Product product, int quantity) async {
    final int iExisted =
        items.indexWhere((item) => item.product?.id == product.id);

    if (iExisted >= 0) {
      items[iExisted].quantity += quantity;
    } else {
      items.add(
        Item(
          itemId: Random().nextInt(100000) + 1,
          product: product,
          quantity: quantity,
        ),
      );
    }

    await _storeItems();
    update();
  }

  Future<void> updateItem(int itemId, int quantity) async {
    final int index = items.indexWhere((item) => item.itemId == itemId);
    if (index == -1) return;

    if (quantity <= 0) {
      items.removeAt(index);
    } else {
      items[index].quantity = quantity;
    }

    await _storeItems();
    update();
  }

  Future<void> removeItem(int itemId) async {
    items.removeWhere((item) => item.itemId == itemId);
    await _storeItems();
    update();
  }

  double get grandTotal {
    return items.fold<double>(
      0,
      (sum, item) => sum + ((item.product?.price ?? 0) * item.quantity),
    );
  }

  List<Product> getRecommendedProducts(List<Product> allProducts) {
    final Set<int?> cartProductIds =
        items.map((item) => item.product?.id).toSet();
    return allProducts
        .where((product) => !cartProductIds.contains(product.id))
        .toList();
  }

  Future<void> _storeItems() async {
    final List<String> itemsInCart =
        items.map((item) => json.encode(item.toJson())).toList();
    await Preference.setStringList(Preference.cart, itemsInCart);
  }
}
