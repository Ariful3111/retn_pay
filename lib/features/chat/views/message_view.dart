import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_notification_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      gradient: AppColors.userBackground.withOpacity(0.5),
      padding: EdgeInsets.only(top: 20.h),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            titleSpacing: 0.w,
            title: CustomAppbar(title: 'Message'),
            leading: CustomAppbarLeading(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            actions: [CustomNotificationButton(),SizedBox(width: 20.w,)],
          ),
          SliverPadding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          sliver: SliverList(delegate: SliverChildListDelegate([

          ])),
          ),
        ],
      ),
    );
  }
}
