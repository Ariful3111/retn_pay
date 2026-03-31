import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AgreementPartCWater extends StatelessWidget {
  const AgreementPartCWater({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextPrimary(
      text:
          'This safety-related activity only applies if the rented premises is in a bushfire prone area and is required to have a water tank for bushfire safety.\n\n(a) If the rented premises is in a designated bushfire-prone area under section 192A of the Building Act 1993 and a water tank is required for firefighting purposes, the rental provider must ensure the water tank and any connected infrastructure is maintained in good repair as required.\n\n(b) The water tank must be full and clean at the commencement of the agreement.',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
