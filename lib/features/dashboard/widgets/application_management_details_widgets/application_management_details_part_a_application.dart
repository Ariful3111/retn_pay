import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartAApplication extends StatelessWidget {
  const ApplicationManagementDetailsPartAApplication({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> item = [
      'Each prospective renter should complete a copy of this application form.',
      'You should contact the rental provider/agent 2 business days after lodging your application to see whether you were successful.',
      'If the application is successful, you may be required to:',
      'Before you enter into an agreement, there are a number of matters the rental provider must tell you about the premises. Please see ‘Part C - Mandatory disclosures checklist’ below.',
      'Before you move in, the rental provider must give you 2 signed copies of the Condition report in the standard form specifying the state of repair and general condition of the premises on the day specified in the report. This can be given to you electronically. You must check the report and return a signed copy to the rental provider within 5 business days after moving in into the property, noting whether you agree or disagree with the whole or any specified part of the report. The Condition report provides evidence of the condition of the property when you move in. Make sure you take your time to review the Condition report carefully.',
      'If the rental provider does not give you the Condition report, you can complete a copy of the Condition report available on the Consumer Affairs Victoria website and provide a signed copy to the rental provider or their agent.',
      'The rental provider is responsible for giving the relevant water corporation your details for billing purposes. It is your responsibility to have all other services (such as telephone, gas and electricity) connected in your name, to coincide with your date of occupation.',
      'The rental provider,s insurance policy does not cover your possessions. It is your responsibility to insure your possessions.',
    ];
    List<String> application = [
      'produce ID (usually a driver\'s license or passport)',
      'pay one month\'s rent in advance',
      'pay the bond amount listed on this form',
      'complete a Residential tenancy agreement to secure the rented premises.',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        item.length,
        (index) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextSecondary(
              text: '•',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: index == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextSecondary(
                          text: item[2],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(application.length, (i){
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextSecondary(
                                    text: '-',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: CustomTextSecondary(
                                      text: application[i],
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    )
                  : CustomTextSecondary(
                      text: item[index],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
