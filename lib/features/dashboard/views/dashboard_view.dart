import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      gradient: AppColors.userBackground.withOpacity(0.5),
      child: Column(),
    );
  }
}