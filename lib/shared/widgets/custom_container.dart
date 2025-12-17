import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Gradient? gradient;
  final Widget ? drawer;
  final Widget ? bottomNav;
  final PreferredSizeWidget ? appbar;
  const CustomContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.margin, this.gradient, this.drawer, this.appbar, this.bottomNav,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      drawer: drawer,
      appBar: appbar,
      body: Container(
        padding: padding,
        margin: margin,
        height: height,
        width: width ?? MediaQuery.widthOf(context),
        decoration: BoxDecoration(gradient:isDark? gradient?? LinearGradient(colors: [AppColors.darkPrimary,AppColors.darkPrimary]):gradient??AppColors.backgroundColor),
        child: SafeArea(child: child),
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}
