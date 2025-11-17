import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/routes/routes.dart';
import 'package:renter_pay/core/themes/theme_bindings.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  ThemeBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renter Pay',
      getPages: appRoutes,
      initialRoute: AppRoutes.onboarding,
      themeMode: themeController.isDarkMode.value?ThemeMode.dark:ThemeMode.light,
      ),
    );
  }
}

