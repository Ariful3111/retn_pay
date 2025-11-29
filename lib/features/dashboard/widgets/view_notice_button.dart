import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/widgets/notice_button_model.dart';

class ViewNoticeButton extends StatelessWidget {
  const ViewNoticeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NoticeButtonModel(
          width: 106.w,
          height: 40.h,
          onTap: () {
            
          },
          icon: IconsPath.renew,
          text: 'Renew',
        ),
        SizedBox(width: 12.w),
        NoticeButtonModel(
          width: 107.w,
          height: 40.h,
          onTap: () {},
          icon: IconsPath.reject,
          text: 'Cancel',
        ),
      ],
    );
  }
}