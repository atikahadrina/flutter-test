import 'package:flutter/material.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/app_text_styles.dart';
import 'app_sizes.dart';

extension AppExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColor get color => AppColor();
  AppGap get gap => AppGap();
  AppPadding get padding => AppPadding();
  AppBorderRadius get borderR => AppBorderRadius();
  AppTextStyle get textStyle => AppTextStyle();
  double get maxWidth => MediaQuery.of(this).size.width;
  double get maxHeight => MediaQuery.of(this).size.height;
}
