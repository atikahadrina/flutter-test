import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:product_cart_app/common_widget/dialog/show_snackbar.dart';
import 'package:product_cart_app/common_widget/product_image_box.dart';
import 'package:product_cart_app/custom_widget/custom_app_bar.dart';
import 'package:product_cart_app/features/cart/controller/cart_controller.dart';
import 'package:product_cart_app/features/cart/model/cart_model.dart';
import 'package:product_cart_app/features/products/controller/product_controller.dart';
import 'package:product_cart_app/features/products/model/product_model.dart';
import 'package:product_cart_app/features/products/widget/button_shared.dart';
import 'package:product_cart_app/routes/app_routes.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.find<CartController>();
  final productController = Get.find<ProductController>();
  SlidableController? _activeSlidable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: primaryColor,
          padding: context.padding.a12,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '· Grand Total',
                  style: context.textStyle
                      .largeTextMid(context)
                      .copyWith(color: context.color.white),
                ),
                context.gap.w20,
                Text(
                  'RM ${cartController.grandTotal.toStringAsFixed(2)}',
                  style: context.textStyle
                      .largeTextBold(context)
                      .copyWith(color: context.color.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: context.padding.h12,
        child: Obx(() {
          final recommended = productController.products.isEmpty
              ? <Product>[]
              : cartController.getRecommendedProducts(
                  productController.products,
                );

          if (cartController.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No products in cart.',
                    style: context.textStyle.mediumText(context),
                  ),
                  context.gap.h20,
                  SizedBox(
                    width: context.maxWidth / 2,
                    child: CustomButton(
                      title: 'Go Shopping!',
                      isFilled: true,
                      onTap: () async {
                        Get.toNamed(AppRoutes.homePage);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return SlidableAutoCloseBehavior(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.w),
                    child: Text(
                      'List of Items',
                      style: context.textStyle.mediumTextBold(context),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = cartController.items[index];
                    return _itemWidget(item);
                  }, childCount: cartController.items.length),
                ),
                if (recommended.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.w),
                      child: recommendations(recommended),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  _itemWidget(Item i) {
    return Slidable(
      key: Key(i.itemId.toString()),
      controller: _activeSlidable,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (context) async {
              await cartController.removeItem(i.itemId);

              ShowSnackBar.open(
                context,
                'Successfulyy removed the item from cart',
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: Padding(
        padding: context.padding.a8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageBox(imageUrl: i.product!.image ?? '', imageSize: 15.w),
            context.gap.w12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    i.product?.title ?? '',
                    style: context.textStyle.mediumTextMid(context),
                  ),
                  context.gap.h4,
                  Row(
                    children: [
                      Text(
                        'Price: ${i.product!.price?.toStringAsFixed(2)}',
                        style: context.textStyle
                            .mediumTextMid(context)
                            .copyWith(color: primaryColor),
                      ),
                      const Spacer(),
                      counterQuantity(i.itemId, i.quantity),
                    ],
                  ),
                ],
              ),
            ),
            context.gap.w12,
          ],
        ),
      ),
    );
  }

  counterQuantity(int itemId, int quantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (quantity > 1) quantity--;
            });
            cartController.updateItem(itemId, quantity);
          },
          icon: Icon(Icons.remove, size: 12.w),
        ),
        Container(
          padding: context.padding.a4,
          color: context.color.lightGrey,
          child: Text(
            '$quantity',
            style: context.textStyle.smallTextMid(context),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              quantity++;
            });
            cartController.updateItem(itemId, quantity);
          },
          icon: Icon(Icons.add, size: 12.w),
        ),
      ],
    );
  }

  recommendations(List<Product> recommended) {
    if (recommended.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Picks', style: context.textStyle.mediumTextBold(context)),
        context.gap.h12,
        SizedBox(
          height: 100.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recommended.length,
            separatorBuilder: (_, __) => context.gap.w12,
            itemBuilder: (context, index) {
              final product = recommended[index];

              return InkWell(
                onTap: () async {
                  await cartController.addToCart(product, 1);
                  ShowSnackBar.open(
                    context,
                    'Added to cart',
                    duration: const Duration(seconds: 2),
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ProductImageBox(
                      imageUrl: product.image ?? '',
                      isProductRow: true,
                    ),
                    Positioned(
                      right: 6.w,
                      bottom: 20.w,
                      child: CircleAvatar(
                        radius: 10.w,
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.add,
                          size: 12.w,
                          color: context.color.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
