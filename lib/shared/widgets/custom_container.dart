import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Gradient? gradient;
  const CustomContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.margin, this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      body: Container(
        padding: padding,
        margin: margin,
        height: height ?? MediaQuery.of(context).size.height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient:themeController.isDarkMode.value? gradient?? LinearGradient(colors: [AppColors.darkPrimary,AppColors.darkPrimary]):AppColors.backgroundColor),
        child: SafeArea(child: child),
      ),
    );
  }
}
