import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/privacy_controller.dart';
import 'package:renter_pay/features/profile/widgets/privacy_policy_widgets/introduction_policy_table.dart';
import 'package:renter_pay/features/profile/widgets/privacy_policy_widgets/policy_terms_helper.dart';
import 'package:renter_pay/features/profile/widgets/privacy_policy_widgets/text_model.dart';

class IntroductionPolicy extends StatelessWidget with PolicyTermsHelper {
  const IntroductionPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    PrivacyController privacyController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        plainText(
          text:
              '''This Privacy Policy outlines how "Renter Pay", a residential property management application platform operating inVictoria, Australia, collects, uses, stores, and discloses personal information. The purpose of this section is to provide a foundational understanding of the legal framework governing our privacy practices, ensuring compliance with both Australian federal and Victorian state privacy legislation. This policy is designed to uphold your privacy rights and manage your personal information transparently and securely. Our operations are primarily governed by the Privacy Act 1988 (Cth) and, under specific circumstances, by relevant Victorian state legislation.''',
        ),
        SizedBox(height: 16.h),
        titleText(
          text: 'Australian Federal Legislation: Privacy Act 1988 (Cth)',
          context: context,
          fontSize: 15.sp,
        ),
        SizedBox(height: 8.h),
        TextModel(
          text:
              '''The Privacy Act 1988 (Cth) (the Act) is Australia's principal federal legislation regulating the handling of personal information by most private sector organizations [1]. For a residential property management app, the Act is generally applicable if the app's managing entity has an annual turnover exceeding AU\$3 million . It also applies to health service providers, businesses engaged in trading personal information, and contractors to the Australian government, irrespective of their turnover [1]. Given its nature, a residential property management app is highly likely to fall under the scope of this Act due to its extensive handling of personal information, potentially meeting the turnover threshold or engaging in significant data processing [1]. The Act applies to Australian entities operating domestically and overseas entities processing Australian residents' data [1]

The Act includes 13 Australian Privacy Principles (APPs), which are central to how personal information is handled. Key APPs relevant to our operations include:''',
          onTap: (reference) {},
        ),
        SizedBox(height: 8.h),
        ...List.generate(privacyController.appText.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pointText(
                  text: privacyController.appText[index]['Title'],
                  context: context,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextModel(
                    text: privacyController.appText[index]['subTitle'],
                    onTap: (reference) {},
                  ),
                ),
              ],
            ),
          );
        }),
        SizedBox(height: 8.h),
        TextModel(
          text:
              '''Additionally, the Act incorporates the Notifiable Data Breaches (NDB)[2] scheme, which requires notification to affected individuals and the Office of the Australian Information Commissioner (OAIC) if a data breach is likely to result in serious harm [1]''',
          onTap: (reference) {},
        ),
        SizedBox(height: 16.h),

        titleText(text: 'Victorian State Legislation', context: context),
        SizedBox(height: 16.h),
        plainText(
          text:
              'While the federal Privacy Act 1988 (Cth) is the primary legislation, Victorian state laws may also apply in specific circumstances:',
        ),
        SizedBox(height: 8.h),
        ...List.generate(privacyController.victorianText.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pointText(
                  text: privacyController.victorianText[index]['Title'],
                  context: context,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextModel(
                    text: privacyController.victorianText[index]['subTitle'],
                    onTap: (reference) {},
                  ),
                ),
              ],
            ),
          );
        }),
        SizedBox(height: 16.h),
        titleText(
          text: 'Interaction of Federal and State Laws',
          context: context,
        ),
        SizedBox(height: 16.h),
        TextModel(
          text:
              '''For [App Name], the federal Privacy Act 1988 (Cth) serves as the primary and most comprehensive legislation governing the general handling of personal information . While the Privacy and Data Protection Act 2014 (Vic) typically does not directly apply to our private operations unless specific contracting scenarios arise [2], the Health Records Act 2001 (Vic) will apply concurrently with the federal Act if any health information is handled [2]. In cases where both federal and state laws apply to specific types of information (e.g., health information), our practice is to adhere to the stricter requirements to ensure maximum protection of your privacy [2]. This foundational legal framework guides our approach to privacy, ensuring we meet all applicable obligations in Victoria, Australia.''',
          onTap: (reference) {},
        ),
        SizedBox(height: 16.h),
        titleText(text: 'Information We Collect', context: context),
        SizedBox(height: 16.h),
        TextModel(
          text:
              '''In adherence to the Privacy Act 1988 (Cth) and the Victorian Privacy and Data Protection Act 2014 (PDP Act), this section outlines the categories of personal information we collect through our residential property management platform. Our collection practices are guided by the principles of reasonable necessity, lawful and fair means, and transparent consent, particularly for sensitive information. Personal information is broadly defined as information that identifies an individual or makes them reasonably identifiable [3]. Sensitive information, a subset of personal information, receives a higher level of protection due to its nature, including details such as health information or racial origin [3].

The following table details the types of personal information we may collect:''',
          onTap: (reference) {},
        ),
        SizedBox(height: 16.h),
        IntroductionPolicyTable(),
        SizedBox(height: 16.h),
      ],
    );
  }
}
