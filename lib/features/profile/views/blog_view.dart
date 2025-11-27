import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/widgets/blog_item.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_pagination.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h),
      gradient:isDark? LinearGradient(colors: [
        AppColors.darkPrimary,
        AppColors.darkPrimary,
      ]):AppColors.userBackground,
      drawer: Drawer(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            titleSpacing: 0.w,
            title: CustomAppbar(
              title: 'Blog',
            ),
          ),
          SliverPadding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          sliver: SliverList(delegate: SliverChildListDelegate([
            Column(children: [
              CustomTextPrimary(text: 'Our Blogs',fontSize: 24.sp,),
            SizedBox(height: 8.h,),
            CustomTextSecondary(text: 'Read our recent blogs',fontSize: 14.sp,fontWeight: FontWeight.w400,),
            SizedBox(height: 20.h,),
            BlogItem(),
            SizedBox(height: 10,),
            CustomPagination(),
            ],)
          ])),
          ),
          
        ],
      ));
  }
}