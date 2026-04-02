import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/chat/controllers/create_chat_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/notice_button_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ActivePropertyContact extends StatelessWidget {
  final String name;
  final String phone;
  final String description;
  final String leaseDurationLabel;
  final String leaseDurationValue;
  final String imageUrl;
  final VoidCallback? onChatTap;
  final bool showChat;
  final int otherUserID;

  const ActivePropertyContact({
    super.key,
    this.name = 'Ariful Islam',
    this.phone = '+233844423443334',
    this.description =
        'A landlord is an individual or entity that owns property and rents it out to tenants. They are responsible for maintaining the property, ensuring...',
    this.leaseDurationLabel = 'Lease Duration',
    this.leaseDurationValue = '23 Aug 2025',
    this.onChatTap,
    this.showChat = true,
    this.imageUrl = '',
    required this.otherUserID,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final leaseText = leaseDurationValue.trim().isEmpty
        ? '23 Aug 2025'
        : leaseDurationValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 43.58.h,
              width: 43.58.w,
            ),
            SizedBox(width: 13.07.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextPrimary(
                  text: name,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextSecondary(text: phone, fontWeight: FontWeight.w400),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomTextSecondary(text: description, fontWeight: FontWeight.w400),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextSecondary(
                  text: leaseDurationLabel,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightText,
                ),
                SizedBox(height: 5.h),
                CustomTextSecondary(
                  fontSize: 20.sp,
                  text: leaseText,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.darkContainer,
                ),
              ],
            ),
            if (showChat)
              Obx(
                () => Get.find<CreateChatController>().isLoading.value
                    ? ButtonLoading()
                    : NoticeButtonModel(
                        onTap: () async {
                          final createChatController =
                              Get.find<CreateChatController>();
                          await createChatController.getCreateChat(
                            otherUserID: otherUserID,
                          );
                        },
                        icon: IconsPath.dashboardChat,
                        text: 'Chat',
                      ),
              ),
          ],
        ),
      ],
    );
  }
}
