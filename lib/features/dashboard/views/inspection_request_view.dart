import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_drawer.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_type.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionRequestView extends StatelessWidget {
  const InspectionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.w,left: 20.w,right: 20.w),
      gradient: isDark
          ? LinearGradient(colors: [AppColors.darkAppBar, AppColors.darkAppBar])
          : AppColors.userBackground.withOpacity(0.5),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DashboardDrawer();
                    },
                  );
                },
                child: Image.asset(IconsPath.profileDrawer,height: 24.h,width: 24.w,),
              ),
              SizedBox(width: 8.w,),
              CustomTextSecondary(text: 'Inspection Request',fontSize: 20.sp,color: AppColors.primaryTextColor,),
            ],
          ),
          SizedBox(height: 24.h,),
          InspectionType()
        ],
      ),
    );
  }
}
