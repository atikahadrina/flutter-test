import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_cart_app/common_widget/shared_widgets.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class AddToCartButton extends StatefulWidget {
  final String title;
  final void Function()? onTap;
  final double? paddingValue;
  final bool isFilled;
  const AddToCartButton(
      {super.key,
      required this.title,
      this.onTap,
      this.paddingValue,
      required this.isFilled});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.a8,
      child: NoSplashInkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: widget.isFilled ? primaryColor : context.color.white,
              border: Border.all(color: primaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: Center(
              child: Text(
                widget.title,
                style: context.textStyle.largeTextMid(context).copyWith(
                    color: widget.isFilled ? context.color.white : primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
