import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final Color? shadowColor;
  final bool? circularButton;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color,
      this.textColor,
      this.fontSize,
      this.shadowColor,
      this.circularButton,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightMax(context) * .06,
      width: screenWidthMax(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.w,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: circularButton == true
                ? context.borderR.br24
                : borderRadius ?? context.borderR.br8,
          ),
        ),
        onPressed: onTap != null
            ? () {
                onTap!();
              }
            : null,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: context.textStyle.largeText(context).copyWith(
                color: textColor ?? Colors.white,
                fontSize: fontSize,
              ),
        ),
      ),
    );
  }
}
