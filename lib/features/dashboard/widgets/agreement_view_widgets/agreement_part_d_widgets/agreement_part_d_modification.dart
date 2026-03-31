import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartDModification extends StatelessWidget {
  const AgreementPartDModification({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text: 'The renter:',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
        CustomBulletPointText(
          items: [
            'may make some modifications without seeking consent. These modifications are listed on the Consumer Affairs website.',
            'must seek the rental provider’s consent before installing any other fixtures or additions.',
            'may apply to VCAT if they believe that the rental provider has unreasonably refused consent for a modification mentioned in the Act.',
            'at the end of the agreement, must restore the premises to the condition it was in before they moved in (excluding fair wear and tear). This includes removing all modifications, unless the parties agree they do not need to be removed.',
          ],
        ),
        SizedBox(height: 16.h),
        CustomTextPrimary(
          text: 'The rental provider:',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),

        SizedBox(height: 8.h),
        CustomBulletPointText(
          items: [
            'must not unreasonably refuse consent for certain modifications.',
          ],
        ),
        SizedBox(height: 16.h),
        CustomTextPrimary(
          text:
              'A list of the modifications that the rental provider cannot unreasonably refuse consent for is available on the Consumer Affairs Victoria website at www.consumer.vic.gov.au/renting.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isDark?AppColors.darkSecondaryText:AppColors.darkContainer,
        ),
      ],
    );
  }
}
