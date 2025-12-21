import 'package:flutter/material.dart';
import 'package:product_cart_app/theme/theme_extension.dart';

class ShowSnackBar {
  static open(BuildContext context, String title,
      {Duration? duration, bool? isDismissable = true, SnackBarAction? action}) {
    final snackBar = SnackBar(
      duration: duration ?? const Duration(seconds: 4),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      content: Text(
        title,
        style: context.textStyle
            .mediumText(context)
            .copyWith(color: context.color.white),
      ),
      action: isDismissable == true
          ? SnackBarAction(
              label: 'Dismiss',
              textColor: Colors.red,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).clearSnackBars();
              },
            )
          : action,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
