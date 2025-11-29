import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/widgets/notice_button_model.dart';
import 'package:renter_pay/features/dashboard/widgets/view_notice.dart';

class NoticeButton extends StatelessWidget {
  const NoticeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NoticeButtonModel(
          width: 88.w,
          height: 40.h,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(child: ViewNotice()); 
              },
            );
          },
          icon: IconsPath.view,
          text: 'View',
        ),
        SizedBox(width: 12.w),
        NoticeButtonModel(
          width: 102.w,
          height: 40.h,
          onTap: () {},
          icon: IconsPath.reject,
          text: 'Reject',
        ),
      ],
    );
  }

  
}
