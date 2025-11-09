import 'package:flutter/material.dart';
import 'package:renter_pay/features/auth/widgets/onboarding_text.dart';

class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnboardingText(
          title: "Connect Tenants and\nLandlords Seamlessly",
          subtitle:
              "Manage listings, handle tenant inquiries, and\nkeep every property transaction smooth and\nprofessional through RenterPay.",
        ),
      ],
    );
  }
}
