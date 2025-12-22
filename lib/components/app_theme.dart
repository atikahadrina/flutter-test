import 'package:flutter/material.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/app_text_styles.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class AppTheme {
  /// Build the light theme with Lato as the base font and sizing from AppTextStyle.
  static ThemeData light(BuildContext context) {
    final styles = AppTextStyle();
    final baseTextTheme = Theme.of(context).textTheme;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: context.color.white,
      canvasColor: Colors.transparent,
      fontFamily: null,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: context.color.white,
        foregroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: styles.largeTextMid(context),
        iconTheme: const IconThemeData(color: Color(0xff495057)),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: context.color.white,
        elevation: 2,
      ),
      tabBarTheme: TabBarThemeData(
        unselectedLabelColor: const Color(0xFF6B7280),
        labelColor: context.color.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: styles.smallText(context),
        fillColor: _inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      textTheme: baseTextTheme.copyWith(
        bodySmall: styles.smallText(context),
        bodyMedium: styles.mediumText(context),
        bodyLarge: styles.largeText(context),
        titleSmall: styles.mediumTextMid(context),
        titleMedium: styles.largeTextMid(context),
        titleLarge: styles.hugeTextMid(context),
        labelLarge: styles.smallTextMid(context),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        surfaceTintColor: context.color.white,
        textStyle: context.textStyle.mediumText(context).copyWith(color: context.color.white)
      )),
      dialogTheme: DialogThemeData(backgroundColor: context.color.white),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: context.color.white,
        surfaceTintColor: context.color.white,
      ),
    );
  }

  static const Color _inputBackground = Color(0xFF26282F);
}
