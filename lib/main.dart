import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/di/dependency_injection.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/routes/routes.dart';
import 'package:renter_pay/core/themes/app_theme.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/auth/bindings/onboarding_bindings.dart';
import 'package:renter_pay/features/auth/views/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) {
        return GetX<ThemeController>(
          init: Get.put(ThemeController(), permanent: true),
          builder: (controller) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Renter Pay',
              initialBinding: OnboardingBindings(),
              getPages: appRoutes,
              initialRoute: AppRoutes.onboarding,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: controller.currentTheme,
              home: const Onboarding(),
            );
          },
        );
      },
    );
  }
}
