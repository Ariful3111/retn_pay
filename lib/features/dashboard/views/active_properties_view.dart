import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_image.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_rent_notice.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:renter_pay/shared/widgets/property/property_details_info.dart';

class ActivePropertiesView extends StatelessWidget {
  const ActivePropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            children: [
              CustomAppbarLeading(
                icon: IconsPath.profileDrawer,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDrawer();
                    },
                  );
                },
              ),
              SizedBox(width: 8.w),
              CustomAppbar(title: 'Active Properties'),
            ],
          ),
          SizedBox(height: 20.h),
          ActivePropertyImage(),
          SizedBox(height: 20.h),
          PropertyDetailsInfo(),
          SizedBox(height: 20.h,),
          DashboardRentNotice(),
          SizedBox(height: 20.h),
          ActivePropertyWidgets(),
        ],
      ),
    );
  }
}
