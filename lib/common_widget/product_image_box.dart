import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';
import 'package:product_cart_app/theme/theme_extension.dart';
import 'package:shimmer/shimmer.dart';

class ProductImageBox extends StatelessWidget {
  final String imageUrl;
  final bool? isProductRow;
  final bool? isGreyBg;
  final bool? onlyImage;
  final EdgeInsetsGeometry? padding;
  final double? imageSize;
  const ProductImageBox(
      {super.key,
      required this.imageUrl,
      this.isProductRow,
      this.isGreyBg = true,
      this.onlyImage,
      this.padding,
      this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: onlyImage == true ? null :isProductRow == true
          ? isMobileV2(context)
              ? (context.maxWidth - 110.w) / 3
              : 100.w
          : isMobileV2(context)
              ? (context.maxWidth - 70.w) / 3
              : 100.w,
      height: onlyImage == true ? null : isProductRow == true
          ? isMobileV2(context)
              ? (context.maxWidth - 110.w) / 3
              : 100.w
          : isMobileV2(context)
              ? (context.maxWidth - 70.w) / 3
              : 100.w,
      padding: padding ?? context.padding.a8,
      decoration: BoxDecoration(
        borderRadius: context.borderR.br12,
        color: isGreyBg == true ? Colors.grey.shade100 : Colors.white,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: imageSize ?? 80.w,
        height: imageSize ?? 80.w,
        colorBlendMode: BlendMode.multiply,
        color: isGreyBg == true
            ? context.color.grey.shade100
            : context.color.white,
        placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: context.borderR.br12,
                color: context.color.white,
              ),
              height: 50.w,
              width: 50.w,
            )),
        errorWidget: (context, url, error) => Icon(
          Icons.image_not_supported_rounded,
          size: iconSize(context),
        ),
      ),
    );

    //   Container(
    //     width: imageSize ?? 80.w,
    //     height: imageSize ?? 80.w,
    //     decoration: BoxDecoration(
    //       color: context.color.grey.shade100,
    //       image: DecorationImage(
    //         image: CachedNetworkImageProvider(imageUrl),
    //         fit: BoxFit.contain,
    //         colorFilter: isGreyBg == true
    //             ? ColorFilter.mode(
    //                 context.color.grey.shade100, BlendMode.multiply)
    //             : ColorFilter.mode(context.color.white, BlendMode.multiply),
    //         onError: (exception, stackTrace) {
    //           Icon(
    //             Icons.image_not_supported_rounded,
    //             size: 30.w,
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
