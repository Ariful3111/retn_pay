import 'package:flutter/material.dart';
import 'package:renter_pay/features/auth/widgets/onboarding_text.dart';

class FourthOnboarding extends StatelessWidget {
  const FourthOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnboardingText(
          title: "Experience Homes\nfrom Anywhere",
          subtitle:
              "Explore rental properties through Virtual Tour/n— walk through rooms, inspect details, and\nfall in love before you visit.",
        ),
      ],
    );
  }
}
