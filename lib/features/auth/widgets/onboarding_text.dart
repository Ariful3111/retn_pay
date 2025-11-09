import 'package:flutter/material.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class OnboardingText extends StatelessWidget {
  final String title;
  final String subtitle;
  const OnboardingText({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.primaryText(text: title),
        CustomText.secondaryText(text: subtitle),
      ],
    );
  }
}
