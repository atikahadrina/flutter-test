import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:product_cart_app/common_widget/dialog/show_custom_dialog.dart';
import 'package:product_cart_app/common_widget/loading_wave_block.dart';
import 'package:product_cart_app/routes/app_routes.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/theme_extension.dart';
import 'package:shimmer/shimmer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  Future<void> checkInternet() async {
    try {
      final response = await InternetAddress.lookup(
        "www.apple.com",
      ).timeout(const Duration(seconds: 10));
      if (response.isNotEmpty) {
        onLoading();
      }
    } on SocketException {
      if (mounted) {
        ShowCustomDialog.open(
          context,
          title: "Internet Not Found",
          subtitle:
              "This app requires proper connection. Please connect with Internet",
          onOkay: () {
            Navigator.of(context).pop();
          },
        );
      }
    }
  }

  onLoading() async {
    Timer(Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 160.w,
                    color: context.color.white,
                  ),
                  Shimmer(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.green,
                        Colors.blue,
                        Colors.indigo,
                        Colors.purple,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    child: Icon(Icons.shopping_bag, size: 150.w),
                  ),
                ],
              ),
            ),
            context.gap.h12,
            Text(
              'Happy Shopping Mall',
              style: context.textStyle
                  .hugeTextBold(context)
                  .copyWith(color: context.color.white),
            ),
            SizedBox(height: 80.h,),
            const LoadingWaveBlocks(),
          ],
        ),
      ),
    );
  }
}
