import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/widgets/contact_field.dart';
import 'package:renter_pay/features/profile/widgets/contact_us_info.dart';
import 'package:renter_pay/shared/widgets/appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.only(top: 10.h,),
      gradient: AppColors.userBackground.withOpacity(0.5),
      drawer: Drawer(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: false,
            floating: true,
            snap: true,
            titleSpacing: 0.w,
            title: CustomAppbar(
              title: 'Contact Us',
            ),
          ),
          SliverPadding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          sliver: SliverList(delegate: SliverChildListDelegate([
            SizedBox(height: 24.h,),
            ContactField(),
            SizedBox(height: 32.h,),
            ContactUsInfo(),
          ])),
          )
        ],
      ),
    );
  }
  
}