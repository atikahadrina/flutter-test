import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_cart_app/custom_widget/custom_button.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class ShowCustomDialog {
  static open(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback? onOkay,
    bool? isCancelButton = true,
    VoidCallback? onCancel,
    String? onCancelText,
    String? onOkayText,
    Widget? headerWidget,
    bool? isDismissible,
    bool? circularButton = false,
  }) {
    return showDialog(
      barrierDismissible: isDismissible ?? true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: context.padding.a16,
          shape: RoundedRectangleBorder(
            borderRadius: context.borderR.br8,
          ),
          elevation: 0,
          backgroundColor: context.color.white,
          child: Container(
            width: context.isPhone ? context.maxWidth : context.maxWidth / 1.5,
            padding: context.padding.a20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                headerWidget ?? const SizedBox.shrink(),
                Text(
                  title,
                  style: context.textStyle.largeTextBold(context),
                ),
                context.gap.h16,
                Text(
                  subtitle,
                  style: context.textStyle.mediumText(context).copyWith(
                        color: context.color.grey,
                      ),
                  textAlign: TextAlign.center,
                ),
                context.gap.h24,
                CustomButton(
                  title: onOkayText ?? 'Okay',
                  // circularButton: circularButton ?? false,
                  onTap: onOkay,
                ),
                context.gap.h12,
                if (isCancelButton!)
                  CustomButton(
                    color: context.color.white,
                    textColor: context.color.black,
                    title: onCancelText ?? 'Cancel',
                    // circularButton: circularButton ?? false,
                    onTap: onCancel ??
                        () async {
                          Navigator.pop(context);
                        },
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
