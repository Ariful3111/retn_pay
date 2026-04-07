import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/popular_controller.dart';
import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/features/home/controllers/recommended_controller.dart';
import 'package:renter_pay/features/home/widgets/category_filter.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class CategorySeeAllView extends StatefulWidget {
  final String categoryName;
  final String categorySlug;

  const CategorySeeAllView({
    super.key,
    required this.categoryName,
    required this.categorySlug,
  });

  @override
  State<CategorySeeAllView> createState() => _CategorySeeAllViewState();
}

class _CategorySeeAllViewState extends State<CategorySeeAllView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    // Reset all filter controllers
    Get.find<HomeController>().resetFilters();
    Get.find<PropertyAmenitiesController>().resetFilters();
    Get.find<PropertyAddressController>().resetFilters();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeController>().getProperties();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          // Header
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.primaryTextColor
                        : AppColors.darkAppBar,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18.sp,
                    color: isDark
                        ? AppColors.darkAppBar
                        : AppColors.primaryTextColor,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomTextPrimary(
                  text: widget.categoryName,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Search and Filter Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    border: Border.all(
                      width: 1.sp,
                      color: isDark
                          ? AppColors.darkBorderPrimary
                          : AppColors.secondaryBorder,
                    ),
                    color: isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 25.sp,
                        spreadRadius: 0,
                        color: AppColors.darkPrimary.withValues(alpha: 0.10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: CustomTextField(
                      padding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enableBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value.toLowerCase();
                        });
                      },
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 16.sp),
                        child: Image.asset(
                          IconsPath.homeSearch,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      labelText: 'Search...',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isFilled: false,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CategoryFilter(
                        propertyAddressController: Get.find(),
                      );
                    },
                  );
                },
                child: Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    border: Border.all(
                      width: 1.sp,
                      color: isDark
                          ? AppColors.darkBorderPrimary
                          : AppColors.secondaryBorder,
                    ),
                    gradient: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 20.sp,
                        spreadRadius: 0,
                        color: AppColors.darkPrimary.withValues(alpha: 0.10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      IconsPath.homeFilter,
                      height: 18.h,
                      width: 18.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Property List
          Expanded(
            child: Obx(() {
              if (Get.find<HomeController>().isLoading.value) {
                return ButtonLoading();
              }

              final allProperties = _getFilteredProperties();
              final properties = _searchQuery.isEmpty
                  ? allProperties
                  : allProperties.where((property) {
                      final title = (property.title ?? '').toLowerCase();
                      final description = (property.description ?? '')
                          .toLowerCase();
                      final address = (property.address ?? '').toLowerCase();
                      final city = (property.city ?? '').toLowerCase();
                      return title.contains(_searchQuery) ||
                          description.contains(_searchQuery) ||
                          address.contains(_searchQuery) ||
                          city.contains(_searchQuery);
                    }).toList();

              if (properties.isEmpty) {
                return Center(
                  child: Text(
                    _searchQuery.isEmpty
                        ? 'No Properties Available'
                        : 'No Results Found',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: isDark
                          ? AppColors.darkSecondaryText
                          : AppColors.secondaryTextColor,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: ItemContainer(
                      property: property,
                      imageHeight: 220.h,
                      imageWidth: double.infinity,
                      padding: EdgeInsets.zero,
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  List<Property> _getFilteredProperties() {
    switch (widget.categorySlug.toLowerCase()) {
      case 'recommended':
        return Get.find<RecommendedController>()
                .recommendedProperties
                .value
                ?.data
                ?.data ??
            [];
      case 'popular':
        return Get.find<PopularController>()
                .popularProperties
                .value
                ?.data
                ?.data ??
            [];
      default:
        final controller = Get.find<HomeController>();
        final allProperties = controller.properties.value?.data?.data ?? [];
        // Filter by category slug and apply API filters (budget, amenities, address)
        return allProperties
            .where(
              (element) => element.propertyType?.slug == widget.categorySlug,
            )
            .toList();
    }
  }
}
