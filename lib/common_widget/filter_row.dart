import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_cart_app/common_widget/shared_widgets.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class FilterOption {
  final String label;
  final int? quantity;

  const FilterOption({
    required this.label,
    this.quantity,
  });
}

class FilterRow extends StatelessWidget {
  final List<FilterOption> filters;
  final int? selectedIndex;
  final ValueChanged<int?> onChanged;
  final EdgeInsetsGeometry? padding;
  final double? spacing;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? textColor;
  final TextStyle? textStyle;

  const FilterRow({
    super.key,
    required this.filters,
    required this.onChanged,
    this.selectedIndex,
    this.padding,
    this.spacing,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.textColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) return const SizedBox.shrink();

    final chipPadding = padding ?? context.padding.h20;
    final chipSpacing = spacing ?? 10.w;
    final chipSelectedColor = selectedColor ?? primaryColor;
    final chipUnselectedColor = unselectedColor ?? context.color.lightGrey;
    final chipSelectedTextColor = selectedTextColor ?? context.color.white;
    final chipTextColor = textColor ?? context.color.black;
    final baseTextStyle = textStyle ??
        context.textStyle.smallText(context);

    final resolvedPadding =
        chipPadding.resolve(Directionality.of(context));
    final leadingInset = resolvedPadding.left;
    final trailingInset = resolvedPadding.right;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: context.padding.v8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leadingInset > 0) SizedBox(width: leadingInset),
          ...filters.asMap().entries.map((entry) {
            final index = entry.key;
            final filter = entry.value;
            final isSelected = selectedIndex == index;

            return Padding(
              padding: EdgeInsets.only(right: chipSpacing),
              child: NoSplashInkWell(
                onTap: () => onChanged(isSelected ? null : index),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.w),
                  decoration: BoxDecoration(
                    color: isSelected ? chipSelectedColor : chipUnselectedColor,
                    borderRadius: BorderRadius.circular(30.w),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Text(
                    filter.label,
                    style: baseTextStyle.copyWith(
                      color:
                          isSelected ? chipSelectedTextColor : chipTextColor,
                    ),
                  ),
                ),
              ),
            );
          }),
          if (trailingInset > 0) SizedBox(width: trailingInset),
        ],
      ),
    );
  }
}
