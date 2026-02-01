import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/di/dependency_injection.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/routes/routes.dart';
import 'package:renter_pay/core/themes/app_theme.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/auth/bindings/onboarding_bindings.dart';
import 'package:renter_pay/features/home/bindings/logged_in_bindings.dart';
import 'package:renter_pay/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String token = await DependencyInjection.init();
  await initUserIndexFromStorage();
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) {
        return GetX<ThemeController>(
          builder: (controller) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Renter Pay',
              initialBinding: token.isNotEmpty
                  ? LoggedInBindings()
                  : OnboardingBindings(),
              getPages: appRoutes,
              initialRoute: token.isNotEmpty
                  ? AppRoutes.mainHome
                  : AppRoutes.onboarding,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: controller.currentTheme,
            );
          },
        );
      },
    );
  }
}
