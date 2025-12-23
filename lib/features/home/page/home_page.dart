import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:product_cart_app/common_widget/filter_row.dart';
import 'package:product_cart_app/common_widget/product_image_box.dart';
import 'package:product_cart_app/common_widget/shared_widgets.dart';
import 'package:product_cart_app/custom_widget/custom_app_bar.dart';
import 'package:product_cart_app/features/products/controller/product_controller.dart';
import 'package:product_cart_app/features/products/model/product_model.dart';
import 'package:product_cart_app/routes/app_routes.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final ProductController productController = Get.put(ProductController());
  String category = "";

  int? selectedIndex;
  final List<FilterOption> filters = const [
    FilterOption(label: "Men's Clothing"),
    FilterOption(label: "Women's Clothing"),
    FilterOption(label: "Electronics"),
    FilterOption(label: "Jewelery"),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.getProductList();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Product> getListToDisplay() {
    if (productController.searchValue.value.isNotEmpty) {
      return productController.searchedProducts;
    } else {
      return productController.products;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (productController.searchValue.value.isNotEmpty &&
            productController.searchedProducts.isEmpty) {
          _searchController.clear();
          productController.clearSearch();
        }
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'Home Page', backButton: false),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Get.toNamed(AppRoutes.cartPage);
          },
          child: Icon(Icons.shopping_cart_outlined, color: context.color.white),
        ),
        body: Padding(
          padding: context.padding.b20,
          child: Obx(() {
            return Column(
              spacing: 8.w,
              children: [
                Container(
                  height: 50.w,
                  width: context.maxWidth,
                  color: primaryColor,
                  padding: context.padding.a8,
                  child: GetBuilder<ProductController>(
                    builder: (p) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search',
                            style: context.textStyle
                                .mediumText(context)
                                .copyWith(color: context.color.white),
                          ),
                          SizedBox(width: 12.w),
                          SizedBox(
                            height: 40.w,
                            width: context.maxWidth / 1.5,
                            child: TextField(
                              controller: _searchController,
                              onChanged: (val) {
                                p.setSearchValue(val);
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: context.color.white,
                                border: OutlineInputBorder(
                                  borderRadius: context.borderR.br8,
                                  borderSide: BorderSide(
                                    color: context.color.mediumGrey,
                                    width: 1.w,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: context.borderR.br8,
                                  borderSide: BorderSide(
                                    color: context.color.mediumGrey,
                                    width: 1.w,
                                  ),
                                ),
                                suffixIcon: _searchController.text.isEmpty
                                    ? Icon(Icons.search, color: primaryColor)
                                    : NoSplashInkWell(
                                        onTap: () {
                                          _searchController.clear();
                                          productController.clearSearch();
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: context.color.red,
                                          size: 16.w,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                FilterRow(
                  filters: filters,
                  selectedIndex: selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedIndex = value;
                      category = value == null ? '' : filters[value].label;
                    });

                    productController.filterByCategory(category);
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: productController.loading.value
                        ? loading()
                        : productController.products.isEmpty
                        ? const Center(child: Text("No products found"))
                        : Wrap(
                            spacing: 8.w,
                            runSpacing: 8.w,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ...getListToDisplay().map((product) {
                                return InkWell(
                                  onTap: () async {
                                    Get.toNamed(
                                      AppRoutes.productDetailsPage,
                                      arguments: product.id,
                                    );
                                  },
                                  child: Container(
                                    width: context.maxWidth / 3.5,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                            12.r,
                                          ),
                                      color: Colors.white,
                                    ),
                                    padding: context.padding.a8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: ProductImageBox(
                                            imageUrl: product.image ?? '',
                                            isGreyBg: false,
                                            padding: context.padding.a4,
                                          ),
                                        ),
                                        context.gap.h8,
                                        Text(
                                          product.title ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        context.gap.h4,
                                        RatingBarIndicator(
                                          rating: product.rating?.rate ?? 0,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 15.w,
                                          unratedColor:
                                              context.color.mediumGrey,
                                          direction: Axis.horizontal,
                                        ),
                                        context.gap.h4,
                                        Text(
                                          product.price != null
                                              ? 'RM${product.price?.toStringAsFixed(2)}'
                                              : '',
                                          overflow: TextOverflow.visible,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
