import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient:isDark ? LinearGradient(colors: [
        AppColors.darkPrimary,
        AppColors.darkPrimary,
      ]):AppColors.userBackground.withOpacity(0.5),
      child: CustomScrollView(
        slivers: [
          DashboardAppbar(),
          SliverPadding(padding: EdgeInsetsGeometry.only(top: 20.h,left: 20.w,right: 20.w),
          sliver: SliverList(delegate: SliverChildListDelegate([
            Column(
              children: [
                SizedBox(height: 20.h,)
              ],
            )
          ])),
          )
        ],
      ),
    );
  }
}
