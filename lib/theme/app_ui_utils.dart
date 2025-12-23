import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/breakpoints.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

double screenWidthMax(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeightMax(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool isMobileV2(BuildContext context) {
  return context.maxWidth < Breakpoint.tablet && (context.isPhone == true);
}

Widget divider(BuildContext context, {double? thickness, double? height, Color? color}) {
  return Divider(
      thickness: thickness ?? 1.w,
      height: height ?? 16.w,
      color: color ?? context.color.mediumGrey);
}

bool isMobile(BuildContext context) {
  return context.maxWidth < Breakpoint.tablet &&
      context.maxWidth < context.maxHeight;
}

Widget loading({double? strokeWidth, Color? color}) {
  return Center(
      child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 3.w, color: color ?? primaryColor));
}

double iconSize(context) {
  var textSizeFactor = isMobile(context) ? 1 : 1.3;
  return textSizeFactor * 20.w;
}

double iconNotSupportSize(BuildContext context) {
  return context.isPhone ? 30.w : 50.w;
}

showLoadingIndicator(BuildContext context, {double? strokeWidth, Color? color}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SizedBox(
        width: 10.w,
        height: 10.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(20.w),
          content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 3.0,
              color: color ?? primaryColor,
            ),
          ]),
        ),
      );
    },
  );
}
