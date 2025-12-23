import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';

// w100 = thin
// w200 = extra-light
// w300 = light
// w400 = Normal/ regular/ plain
// w500 = medium
// w600 = semi-bold
// w700 = bold
// w800 = extra-bold
// w900 = ultra-bold (most thick)

class AppTextStyle {
  /// implementing screenUtil based on device size caused the font size smaller than normal
  // spTinyText : 9.sp -> 10.sp;
  // spSmallerText : 10.sp -> 12.sp;
  // spSmallText : 12.sp -> 14.sp;
  // spNormalText : 14.sp -> 16.sp;
  // spLargeText : 16.sp -> 18.sp;
  // spLargerText = 18.sp -> 20.sp;

  TextStyle tinyText(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 9.sp,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle tinyTextMid(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 9.sp,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle tinyTextBold(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 9.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle smallerText(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 10.sp,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle smallerTextMid(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 10.sp,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle smallerTextBold(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 10.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle smallText(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle smallTextMid(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle smallTextBold(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 12.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle mediumText(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle mediumTextMid(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle mediumTextBold(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 14.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle largeText(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle largeTextMid(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 16.sp,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle largeTextBold(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 16.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle hugeText(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 18.sp,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle hugeTextMid(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 18.sp,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle hugeTextBold(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 18.sp,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle extraHugeText(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 20.sp,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle extraHugeMid(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 20.sp,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle extraHugeTextBold(BuildContext context) {
    var textSizeFactor = isMobile(context) ? 1 : 0.8;

    return TextStyle(
      fontSize: textSizeFactor * 20.sp,
      fontWeight: FontWeight.bold,
    );
  }
}
