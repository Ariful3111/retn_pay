import 'package:flutter/material.dart';
import 'package:renter_pay/features/auth/widgets/onboarding_text.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
     
      
      children: [
      OnboardingText(title: "Property Management\nMade Simple", subtitle: "Track rent payments, schedule inspections,\nand assign service vendors — all from your\nlandlord dashboard in RenterPay.")
    ],);
  }
}