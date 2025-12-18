import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/services_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/services_search_suggestion.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServicesSearch extends StatelessWidget {
  const ServicesSearch({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServicesController servicesController = Get.find();
    return TypeAheadField<String>(
      hideOnUnfocus: true,
      itemBuilder: (BuildContext context, String suggestion) {
        return Padding(
          padding: EdgeInsets.all(4.0.r),
          child: CustomTextSecondary(
            text: suggestion,
            fontSize: 14.sp,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.darkContainer,
          ),
        );
      },
      onSelected: (value) {
        servicesController.searchController.text = value;
      },
      controller: servicesController.searchController,
      suggestionsCallback: (String search) {
        return servicesController.serviceList.where((e) {
          return e.toLowerCase().contains(search.toLowerCase());
        }).toList();
      },
      builder: (context, controller, focusNode) {
        focusNode.addListener(() {
          servicesController.isSearchFocus.value = focusNode.hasFocus;
        });
        return CustomTextField(
          controller: controller,
          focusNode: focusNode,
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Image.asset(IconsPath.homeSearch, height: 24.h, width: 24.w),
          ),
          labelText: 'Search services',
        );
      },
      decorationBuilder: (context, child) {
        return Obx(
          () => ServicesSearchSuggestion(
            isFocus: servicesController.isSearchFocus.value,
            child: child,
          ),
        );
      },
    );
  }
}
