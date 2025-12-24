import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_close_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';

class PropertyInsurance extends StatelessWidget {
  final PropertyModel property;
  const PropertyInsurance({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      backgroundColor: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      constraints: BoxConstraints.tight(
        Size(MediaQuery.widthOf(context), 370.h),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: CustomCloseButton(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      content: Container(
        height: MediaQuery.heightOf(context),
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(image: AssetImage(ImagesPath.propertyBanner)),
        ),
      ),
      actions: [
        CustomPrimaryButton(
          height: 40.h,
          width: 259.w,
          borderRadius: BorderRadius.circular(6.r),
          text: 'Back to Property Management',
          onPressed: () {},
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
