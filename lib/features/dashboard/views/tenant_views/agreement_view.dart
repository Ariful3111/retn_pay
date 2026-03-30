import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_header.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_view_widgets.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class AgreementView extends StatelessWidget {
  const AgreementView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      gradient: isDark ? null : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            children: [
              CustomAppbarLeading(onTap: () => Navigator.pop(context)),
              SizedBox(width: 8.w),
              CustomAppbar(title: 'Agreement'),
            ],
          ),
          SizedBox(height: 24.h),
          AgreementHeader(),
          SizedBox(height: 20.h),
          AgreementViewWidgets(),
        ],
      ),
    );
  }
}
