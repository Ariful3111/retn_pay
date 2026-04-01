import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:signature/signature.dart';

class AgreementPartESignaturesPad extends StatelessWidget {
  final String title;
  final SignatureController signatureController;
  final TextEditingController dateController;

  const AgreementPartESignaturesPad({
    super.key,
    required this.title,
    required this.signatureController,
    required this.dateController,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isDark ? AppColors.primaryDarkTextColor : Colors.white,
              border: Border.all(color: AppColors.primaryBorder),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextSecondary(text: title, fontSize: 12.sp),
                SizedBox(height: 8.h),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Signature(
                      controller: signatureController,
                      backgroundColor: isDark
                          ? AppColors.darkTextColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          /// Date Field (your helper)
          AgreementHelper().dateFieldWithPicker(
            controller: dateController,
            labelText: 'Date',
            context: context,
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}
