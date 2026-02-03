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
import 'package:renter_pay/features/auth/controllers/firebase_token_update_controller.dart';
import 'package:renter_pay/features/auth/views/main_loading.dart';
import 'package:renter_pay/features/home/bindings/logged_in_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String token = await DependencyInjection.init();
  await initUserIndexFromStorage();
  runApp(MyApp(token: token));
}

class MyApp extends StatefulWidget {
  final String token;
  const MyApp({super.key, required this.token});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    updateFirebaseToken();
  }

  void updateFirebaseToken() async {
    await Get.find<FirebaseTokenUpdateController>().updateToken();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) {
        return Obx(() {
          final isLoading =
              Get.find<FirebaseTokenUpdateController>().isLoading.value;

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Renter Pay',
            initialBinding: widget.token.isNotEmpty
                ? LoggedInBindings()
                : OnboardingBindings(),
            getPages: appRoutes,
            initialRoute: widget.token.isNotEmpty
                ? AppRoutes.mainHome
                : AppRoutes.onboarding,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: Get.find<ThemeController>().currentTheme,
            builder: (context, child) {
              return Stack(
                children: [
                  child ?? const SizedBox.shrink(),
                  if (isLoading) const MainLoading(),
                ],
              );
            },
          );
        });
      },
    );
  }
}
