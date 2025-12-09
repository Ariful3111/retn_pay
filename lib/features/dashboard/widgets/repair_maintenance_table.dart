import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class RepairMaintenanceTable extends StatelessWidget {
  const RepairMaintenanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MediaQuery(
      data: MediaQueryData(
        size: Size(MediaQuery.widthOf(context), MediaQuery.heightOf(context)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDark?AppColors.darkSecondary:AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(),
      ));
  }
}