import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/privacy_controller.dart';
import 'package:renter_pay/features/profile/widgets/privacy_policy_widgets/text_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class IntroductionPolicyTable extends StatelessWidget {
  const IntroductionPolicyTable({super.key});

  @override
  Widget build(BuildContext context) {
    PrivacyController privacyController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            privacyController.introductionTableColumns.length,
            (index) {
              return Expanded(
                child: Container(
                  height: 48.h,
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkTableHead
                        : AppColors.tableHead,
                  ),
                  child: Center(
                    child: CustomTextPrimary(
                      text: privacyController.introductionTableColumns[index],
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ...List.generate(privacyController.introductionTableData.length, (
          index,
        ) {
          final list = privacyController.introductionTableData[index];
          return Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12.w),
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor,
                    border: Border.all(
                      width: 1.r,
                      color: isDark
                          ? AppColors.darkBorderPrimary
                          : AppColors.primaryBorder,
                    ),
                  ),
                  child: Center(
                    child: CustomTextPrimary(
                      text: list['column1'],
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12.w),
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor,
                    border: Border.all(
                      width: 1.r,
                      color: isDark
                          ? AppColors.darkBorderPrimary
                          : AppColors.primaryBorder,
                    ),
                  ),
                  child: Center(
                    child: TextModel(
                      text: list['column2'],
                      onTap: (int reference) {},
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12.w),
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor,
                    border: Border.all(
                      width: 1.r,
                      color: isDark
                          ? AppColors.darkBorderPrimary
                          : AppColors.primaryBorder,
                    ),
                  ),
                  child: Center(
                    child: TextModel(
                      text: list['column3'],
                      onTap: (int reference) {},
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12.w),
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor,
                    border: Border.all(
                      width: 1.r,
                      color: isDark
                          ? AppColors.darkBorderPrimary
                          : AppColors.primaryBorder,
                    ),
                  ),
                  child: Center(
                    child: TextModel(
                      text: list['column4'],
                      onTap: (int reference) {},
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
