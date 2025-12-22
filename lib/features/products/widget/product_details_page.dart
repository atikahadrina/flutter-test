import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:product_cart_app/common_widget/product_image_box.dart';
import 'package:product_cart_app/components/preferences.dart';
import 'package:product_cart_app/custom_widget/custom_app_bar.dart';
import 'package:product_cart_app/features/cart/model/cart_model.dart';
import 'package:product_cart_app/features/products/controller/product_controller.dart';
import 'package:product_cart_app/features/products/model/product_model.dart';
import 'package:product_cart_app/features/products/widget/button_shared.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';
import 'package:product_cart_app/theme/theme_extension.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductController productController = Get.find<ProductController>();
  final int? productId = Get.arguments as int?;

  @override
  void initState() {
    super.initState();
    if (productId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productController.getProductById(productId!);
      });
    }
  }

  Future<List?> getCarts() async {
    List<String>? encodedCarts = Preference.getStringList('cart');
    if (encodedCarts != null) {
      return encodedCarts
          .map((encodedCart) => json.decode(encodedCart))
          .toList();
    } else {
      return null;
    }
  }

  Future<void> saveCart(Map<String, dynamic> cartData) async {
    List<String>? encodedCarts = Preference.getStringList('cart');
    List<Cart> updatedCarts = [];

    if (encodedCarts != null) {
      updatedCarts = encodedCarts
          .map((encodedCart) => Cart.fromJson(json.decode(encodedCart)))
          .toList();

      bool productExists = false;
      for (Cart cart in updatedCarts) {
        if (cart.product?.id == cartData['product']['id']) {
          cart.quantity += cartData['quantity'];
          productExists = true;
          break;
        }
      }

      if (!productExists) {
        updatedCarts.add(Cart.fromJson(cartData));
      }
    } else {
      updatedCarts.add(Cart.fromJson(cartData));
    }

    List<String> updatedEncodedCarts = updatedCarts
        .map((cart) => json.encode(cart.toJson()))
        .toList();
    await Preference.setStringList('cart', updatedEncodedCarts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product Details',
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
      body: Obx(() {
        final product = productController.currentProduct;
        if (productController.loading.value || product == null) {
          return loading();
        }

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PinchZoom(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.color.white,
                  ),
                  child: 
                  Image.network(
                    product.image ?? 'http://via.placeholder.com/350x150',
                    height: context.maxWidth / 2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              context.gap.h20,
              _information(productController.isLoading, product, context),
              context.gap.h20,
              SizedBox(
                width: context.maxWidth / 2,
                child: AddToCartButton(
                  title: 'Add to cart',
                  isFilled: true,
                  onTap: () async {
                    _showQuantityBottomSheet(context, product);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _showQuantityBottomSheet(BuildContext context, Product product) {
    int quantity = 1;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: context.maxWidth,
              padding: context.padding.a20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add Quantity',
                    style: context.textStyle.largeTextMid(context),
                  ),
                  Padding(
                    padding: context.padding.a20,
                    child: Row(
                      children: [
                        ProductImageBox(
                          imageUrl: product.image ?? '',
                          imageSize: 20.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: context.padding.a8,
                                child: Text(
                                  product.title!,
                                  style: context.textStyle.mediumText(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('$quantity', style: const TextStyle(fontSize: 16.0)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: context.maxWidth / 2,
                    child: AddToCartButton(
                      title: 'Add to cart',
                      isFilled: true,
                      onTap: () async {
                        Map<String, dynamic> cardData = {
                          'cartid': Random().nextInt(100000) + 1,
                          'product': product.toJson(),
                          'quantity': quantity,
                        };
                        await saveCart(cardData).then((value) => Get.back());
                        Get.snackbar(
                          'Success',
                          'Added to cart',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          borderRadius: 8,
                          margin: EdgeInsets.symmetric(
                            horizontal: 4.2.w,
                            vertical: 1.23.h,
                          ),
                          duration: const Duration(seconds: 3),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _information(bool isLoading, Product product, BuildContext context) {
    if (isLoading) {
      return shimmerContainer();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RM ${product.price!.toStringAsFixed(2)}',
                style: context.textStyle
                    .largeTextBold(context)
                    .copyWith(color: context.color.red),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBarIndicator(
                    rating: product.rating?.rate ?? 0,
                    itemBuilder: (context, index) =>
                        Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 25.w,
                    unratedColor: context.color.mediumGrey,
                    direction: Axis.horizontal,
                  ),
                  Padding(
                    padding: context.padding.l12,
                    child: Text(
                      '${product.rating?.count} votes',
                      style: context.textStyle.smallText(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Product Name: '),
              SizedBox(width: 30.w),
              Flexible(flex: 2, child: Text(product.title ?? '')),
            ],
          ),
          context.gap.h12,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Category: '),
              SizedBox(width: 62.w),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Text(product.category ?? 'Unspecified'),
              ),
            ],
          ),
          context.gap.h12,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Description: '),
              SizedBox(width: 48.w),
              Flexible(flex: 2, child: Text(product.description ?? '')),
            ],
          ),
          const Divider(),
        ],
      );
    }
  }

  shimmerContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 24.w,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 250.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 300,
            height: 24,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 150,
            height: 24,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 250,
            height: 24,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 24,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 150,
            height: 24,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 500,
            height: 24,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 150,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        context.gap.h16,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 24,
            decoration: BoxDecoration(
              color: context.color.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ],
    );
  }
}
