import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartCSwimming extends StatelessWidget {
  const AgreementPartCSwimming({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomTextPrimary(
          text: 'These safety-related activities only apply if the rented premises contains a swimming pool.\n\n(a) The rental provider must ensure that the pool barrier is maintained in good repair.\n\n(b) The renter must give written notice to the rental provider as soon as practicable after becoming aware that the swimming pool barrier is not in working order.\n\n(c) The rental provider must arrange for a swimming pool barrier to be immediately repaired or replaced as an urgent repair if they are notified by the renter that it is not in working order.\n\n(d) The rental provider must provide the renter with a copy of the most recent certificate of swimming pool barrier compliance issued under the Building Act 1993 on the request of the renter.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 16.h),
        AgreementHelper().divider(isDark: isDark),
      ],
    );
  }
}