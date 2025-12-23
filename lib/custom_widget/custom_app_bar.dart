import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? widgets;
  final Widget? action;
  final Color? leadingColor;
  final VoidCallback? backTap;
  final Color? backgroundColor;
  final Widget? leading;
  final bool? backButton;

   CustomAppBar(
      {super.key,
      required this.title,
      this.backTap,
      this.widgets,
      this.action,
      this.leading,
      this.backgroundColor,
      this.leadingColor,
      this.backButton = true});

  @override
  Size preferredSize = Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(0.w, 5.w, 5.w, 5.w),
        color: backgroundColor ?? Colors.white,
        height: isMobile(context) ? AppBar().preferredSize.height : screenHeightMax(context) * 0.1,
        child: Stack(children: [
          Positioned.fill(
            child: Center(
                child: Text(
              title,
              style: context.textStyle.hugeTextMid(context),
            )),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    (backButton == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                  color: context.color.lightGrey),
                              child: IconButton(
                                onPressed: backTap != null
                                    ? () {
                                        backTap!();
                                      }
                                    : () {
                                        Navigator.pop(context);
                                      },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: leadingColor ?? primaryColor,
                                ),
                                iconSize: 20.w,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()),
                action ?? const SizedBox.shrink(),
              ]),
        ]),
      ),
    );
  }
}
