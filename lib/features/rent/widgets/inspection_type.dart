import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/controllers/rent_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionType extends StatelessWidget {
  const InspectionType({super.key});

  @override
  Widget build(BuildContext context) {
    RentDetailsController rentDetailsController = Get.find();
    return Obx(() {
      return DropdownMenu<String>(
        initialSelection: rentDetailsController.selectedInspection.value,
        label: Text("inspection Type*"),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.4.r),
            borderSide: BorderSide(width: 0.78.r, color: Color(0xFFDFE2E6)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.4.r),
            borderSide: BorderSide(width: 0.78.r, color: Color(0xFFDFE2E6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.4.r),
            borderSide: BorderSide(width: 0.78.r, color: Color(0xFFDFE2E6)),
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
          alignLabelWithHint: true,
          focusColor: Colors.transparent,
          
        ),
        trailingIcon: Image.asset(
          IconsPath.downArrow,
          height: 15.h,
          width: 10.w,
          color: Color(0xFF868C98),
        ),
        
        selectedTrailingIcon: Image.asset(
          IconsPath.upArrow,
          height: 15.h,
          width: 10.w,
          color: Color(0xFF868C98),
        ),
        width: MediaQuery.widthOf(context),
        menuStyle: MenuStyle(
          
          alignment: Alignment.bottomRight,
          elevation: WidgetStateProperty.all(6),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
          side: WidgetStateProperty.all(
            BorderSide(color: Color(0xFFF1F1F2), width: 0.91.r),
          ),
          
        ),
        
        onSelected: (value) {
          rentDetailsController.selectedInspection.value = value!;
          rentDetailsController.isSelectedInspection.value = true;
        },
        dropdownMenuEntries: rentDetailsController.inspectOption.map((option) {
          bool selected =
              option == rentDetailsController.selectedInspection.value;
          return DropdownMenuEntry<String>(
            value: option,
            label: option,
            labelWidget: dropdownItem(
              gradient: selected ? AppColors.primaryColor : null,
              option: option,
              color: selected ? AppColors.whiteColor : Color(0xFF091E42),
            ),
          );
        }).toList(),
      );
    });
  }

  Widget dropdownItem({
    LinearGradient? gradient,
    required String option,
    required Color color,
  }) {
    return Container(
      height: 33.h,
      width: 119.w,
      padding: EdgeInsets.only(left: 6.27.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.27.r),
        gradient: gradient,
      ),
      child: Center(
        child: CustomTextSecondary(text: option, fontSize: 14.sp, color: color),
      ),
    );
  }
}
