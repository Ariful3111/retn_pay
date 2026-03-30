import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartARenter extends GetWidget<AgreementPartAController> {
  const AgreementPartARenter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AgreementHelper helper = AgreementHelper();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
          text:
              'Each renter that is a party to the agreement must provide their details here.',
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkContainer,
          softWrap: true,
        ),
        SizedBox(height: 16.h),
        // Generate renter sections
        ...List.generate(
          4,
          (renterIndex) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                controller.renterFieldLabels.length,
                (fieldIndex) {
                  String label = controller.renterFieldLabels[fieldIndex];
                  if (fieldIndex == 0) {
                    label = 'Full name of renter ${renterIndex + 1}';
                  }
                  return helper.agreementField(
                    label: label,
                    controller:
                        controller.renterControllers[renterIndex][fieldIndex],
                    isDark: isDark,
                    maxLines: fieldIndex == 1 ? 2 : null, // Address is multiline
                    keyboardType: _getKeyboardType(fieldIndex),
                  );
                },
              ),
            ],
          ),
        ),
        helper.richText(
          title: 'Note: ',
          spantext:
              'The rental provider must notify the renter within 7 days if any of this information changes.',
        ),
        SizedBox(height: 16.h),
        helper.divider(isDark: isDark),
      ],
    );
  }

  TextInputType? _getKeyboardType(int fieldIndex) {
    switch (fieldIndex) {
      case 2: // Postcode
        return TextInputType.number;
      case 3: // Phone number
        return TextInputType.phone;
      case 4: // Email address
        return TextInputType.emailAddress;
      default:
        return null;
    }
  }
}
