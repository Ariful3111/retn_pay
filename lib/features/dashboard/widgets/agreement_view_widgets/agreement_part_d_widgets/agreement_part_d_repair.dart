import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartDRepair extends StatelessWidget {
  const AgreementPartDRepair({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text:
              'Only a suitably qualified person must do repairs - both urgent and non-urgent.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 12.h),
        CustomTextPrimary(
          text: 'Urgent repairs',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
        CustomTextPrimary(
          text:
              'Section 3(1) of the Act defines urgent repairs. Refer to the Consumer Affairs Victoria website for the full list of urgent repairs and for more information, visit www.consumer.vic.gov.au/urgentrepairs. Urgent repairs include failure or breakdown of any essential service or appliance provided for hot water, cooking, heating or laundering supplied by the rental provider.\nThe rental provider must carry out urgent repairs after being notified.\nA renter may arrange for urgent repairs to be done if they have taken reasonable steps to arrange for the rental provider to immediately do the repairs and the rental provider has not carried out the repairs.\nIf the renter has arranged for urgent repairs, the renter may be reimbursed directly by the rental provider for the reasonable cost of repairs up to \$2,500.\nThe renter may apply to VCAT for an order requiring the rental provider to carry out urgent repairs if: ',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 8.h),
        
        CustomBulletPointText(
          items: [
            'The renter cannot meet the cost of the repairs.',
            'The cost of repairs exceeds \$2,500.',
            'The rental provider refuses to reimburse repair costs.',
          ],
        ),
        SizedBox(height: 16.h),
        CustomTextPrimary(
          text: 'Non-urgent repairs',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
    
        CustomBulletPointText(
          items: [
            'The renter must notify the rental provider, in writing, as soon as practicable of:',
          ],
        ),
        SizedBox(height: 6.h),
        CustomBulletPointText(
          items: [
            'Damage to the premises.',
            'Breakdown of facilities, fixtures, furniture or equipment supplied by the rental provider.',
          ],
          title: ['-', '-'],
        ),
        CustomBulletPointText(
          items: [
            'The rental provider must carry out non-urgent repairs within a reasonable time. The renter can apply to VCAT if repairs are not completed within 14 days of notice.',
          ],
        )
      ],
    );
  }
}
