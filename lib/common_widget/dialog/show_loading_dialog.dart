import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class ShowLoadingDialog {
  static open(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: context.padding.a16,
          shape: RoundedRectangleBorder(
            borderRadius: context.borderR.br8,
          ),
          insetAnimationDuration: const Duration(milliseconds: 200),
          backgroundColor: Colors.black.withOpacity(.5),
          child: Container(
            height: context.maxWidth * 0.3,
            width: context.maxWidth * 0.5,
            padding: context.padding.a20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: context.borderR.br8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.w,
                  width: 20.w,
                  child: loading(strokeWidth: 3.w),
                ),
                context.gap.h16,
                Text(
                  'Loading..',
                  style: context.textStyle
                      .mediumText(context)
                      .copyWith(color: primaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
