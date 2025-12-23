import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:product_cart_app/components/app_theme.dart';
import 'package:product_cart_app/components/preferences.dart';
import 'package:product_cart_app/routes/app_pages.dart';
import 'package:product_cart_app/routes/app_routes.dart';
import 'package:product_cart_app/routes/binding/binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Happy Shopping App',
          builder: (context, child) {
            return Scaffold(body: child);
          },
          theme: AppTheme.light(context),
          initialRoute: AppRoutes.landingPage,
          getPages: AppPages.pageList,
          initialBinding: InitialBinding(),
        );
      },
    );
  }
}
