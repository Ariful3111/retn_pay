import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartCRelocatable extends StatelessWidget {
  const AgreementPartCRelocatable({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text:
              'These safety-related activities only apply if a relocatable swimming pool is erected, or is intended to be erected, at the rented premises.\n\n(a) The renter must not put up a relocatable swimming pool without giving written notice to the rental provider before erecting the pool.\n\n(b) The renter must obtain any necessary approvals before erecting a relocatable swimming pool.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 12.h),
        AgreementHelper().richText(
          title: 'Note:',
          spantext:
              ' Regulations made under Building Act 1993 apply to any person erecting a relocatable swimming pool. This safety-related activity only applies to swimming pools or spas that can hold water deeper than 300 mm. ',
        ),
        SizedBox(height: 16.h),
        AgreementHelper().divider(isDark: isDark),
      ],
    );
  }
}
