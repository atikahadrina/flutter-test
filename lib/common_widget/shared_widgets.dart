import 'package:flutter/material.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class NoSplashInkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  const NoSplashInkWell({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.color.transparent,
      highlightColor: context.color.transparent,
      hoverColor: context.color.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
