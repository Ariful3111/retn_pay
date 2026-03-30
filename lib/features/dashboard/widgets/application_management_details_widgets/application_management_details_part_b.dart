import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';

class ApplicationManagementDetailsPartB extends StatelessWidget {
  const ApplicationManagementDetailsPartB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ApplicationManagementDetailsHelper().paragraph(
          'The following statement is required by Schedule 1 of the Residential Tenancies Regulations 2021 and cannot be altered.',
        ),
        ApplicationManagementDetailsHelper().paragraph(
          'Discrimination is treating, or proposing to treat, someone unfavourably because of a personal attribute. Discrimination is also imposing an unreasonable requirement, condition or practice that disadvantages persons with a personal attribute.',
        ),
        ApplicationManagementDetailsHelper().paragraph(
          'In Victoria it is unlawful to discriminate against someone in relation to certain personal attributes. This means that rental providers and real estate agents cannot refuse you accommodation or discriminate against you during your tenancy on the basis of personal attributes protected by law. The following is a list of some protected attributes that are sometimes discriminated against in the rental market—',
        ),
        SizedBox(height: 8.h),
        CustomBulletPointText(
          items: [
            'Age',
            'Disability (physical, sensory, intellectual, mental illness)',
            'Employment activity',
            'Expunged homosexual conviction',
            'Gender identity',
            'Industrial activity (including union activity)',
            'Marital status',
            'Parental status or status as a carer',
            'Physical features',
            'Political belief or activity',
            'Pregnancy or breastfeeding',
            'Race',
            'Religious belief or activity',
            'Lawful sexual activity or sexual orientation',
            'Sex or intersex status',
            'Association with someone who has these personal attributes',
          ],
        ),

        SizedBox(height: 12.h),

        ApplicationManagementDetailsHelper().paragraph(
          'These personal attributes are protected by law and extend to agreements under the Residential Tenancies Act 1997 (the Act). It is against the law for a rental provider or their agent to treat you unfavourably or discriminate against you because of these personal attributes when you are applying for a rental property, occupying a rental property or leaving a rental property.',
        ),
        ApplicationManagementDetailsHelper().paragraph(
          'Discrimination on the basis of any of these personal attributes may contravene Victorian laws including the Act, the Equal Opportunity Act 2010 (the Equal Opportunity Act), and a range of Commonwealth Acts including the Age Discrimination Act 2004, the Disability Discrimination Act 1992, the Racial Discrimination Act 1975 and the Sex Discrimination Act 1984.',
        ),
        ApplicationManagementDetailsHelper().paragraph(
          'In some limited circumstances, discrimination may not be unlawful, including accommodation provided for children, shared family accommodation, and student accommodation. For example, a community housing provider who is funded to provide youth housing may positively discriminate to provide accommodation for a young person. For more information, contact the Victorian Equal Opportunity and Human Rights Commission (VEOHRC). ).',
        ),

        SizedBox(height: 16.h),

        /// 🔹 Section: Applying for Property
        _buildTitle(
          'Some examples of unlawful discrimination in applying for a property:',
        ),

        CustomBulletPointText(
          items: [
            'Refusing or not accepting your application because you have children, unless the premises is unsuitable for occupation by children due to its design or location.',
            'Processing your application differently to other applicants and not giving your application to the rental provider because you have a disability or because of your race.',
            'Offering you the property on different terms by requiring more bond or requiring you to have a guarantor because of your age.',
            'Refusing to provide accommodation because you have an assistance dog.',
          ],
        ),

        SizedBox(height: 16.h),

        /// 🔹 Section: During/Leaving Property
        _buildTitle(
          'Some examples of unlawful discrimination when occupying or leaving a property:',
        ),

        CustomBulletPointText(
          items: [
            'Refusing to agree to you assigning your lease to someone else because of that person\'s personal attributes.',
            'Refusing to allow you to make reasonable alterations or modifications to the property to meet your needs if you have a disability.',
            'Extending or renewing your agreement on less favourable terms than your original agreement based on your protected attributes (e.g. due to a disability).',
            'Issuing you with a notice to vacate based on your protected attributes.',
          ],
        ),

        SizedBox(height: 12.h),

        ApplicationManagementDetailsHelper().paragraph(
          'The examples listed and similar actions could contravene the Act, the Equal Opportunity Act, or the Commonwealth Acts. ',
        ),

        SizedBox(height: 16.h),

        _buildTitle('Getting help:'),

        ApplicationManagementDetailsHelper().paragraph(
          'If a rental provider or a real estate agent has unlawfully discriminated against you and you have suffered loss as a result, you may apply to VCAT for an order for compensation under section 210AA of the Act. VCAT may be contacted online at vcat.vic.gov.au/ or by calling 1300 018 228.\nIf you would like advice about unlawful discrimination in relation to an application to rent or an existing agreement you may call Victoria Legal Aid on 1300 792 387.\nIf you feel you have been unlawfully discriminated against when applying to rent, or once you have occupied a property, you or someone on your behalf may make a complaint to VEOHRC at\nhumanrightscommission.vic.gov.au/ or by calling 1300 292 153.',
        ),
      ],
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomTextPrimary(
        text: text,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
