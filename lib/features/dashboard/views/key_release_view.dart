import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/release_form.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class KeyReleaseView extends StatelessWidget {
  const KeyReleaseView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: ListView(
        children: [
          DrawerItemsAppbar(title: 'Key Release'),
          SizedBox(height: 32.h),
          MediaQuery(
            data: MediaQueryData(
              size: Size(
                MediaQuery.widthOf(context),
                MediaQuery.heightOf(context),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ReleaseForm(),
            ),
          ),
        ],
      ),
    );
  }
}
