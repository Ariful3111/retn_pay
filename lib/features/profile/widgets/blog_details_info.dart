import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BlogDetailsInfo extends StatelessWidget {
  const BlogDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    List titleList = <String>[
      '1. Use the Official Channel',
      '2. Be Clear and Specific',
      '3. Know What Counts as Urgent',
      '4. Track the Progress',
      '5. Keep Communication Friendly',
      '6. Keep Records for Future Reference',
    ];
    List subtitleList = <String>[
      'Always submit your maintenance request through the RenterPay app or your landlord’s official portal — not through personal calls or text messages. Submitting through the app creates a digital record of your request, including the time, date, and description of the problem. This record protects you in case of disputes and ensures nothing is overlooked. It also allows the landlord to assign a verified service vendor through the system, making the process transparent and trackable.Pro Tip: Avoid reporting maintenance issues verbally unless it\'s an emergency. Written requests are easier to track and manage for everyone involved.',
      'A vague message like “The tap is\'t working” doesn\'t give much information. The more detailed you are, the faster your issue can be resolved. For example, write:“The kitchen tap has been leaking continuously for two days, and water is pooling near the sink cabinet.”Add photos or short videos directly through the RenterPay app to show the issue visually. This helps the vendor prepare before arriving — saving time, tools, and follow-up visits.Pro Tip: Mention exactly where the problem is, how long it\'s been happening, and if it\'s affecting other areas (e.g., “leak is spreading to the floor” or “AC not cooling the living room”).',
      'Not every maintenance issue is an emergency — but when it is, knowing how to report it correctly can make a big difference.Emergency issues include:\nGas leaks or smell of gas\nMajor water leaks or flooding\nElectrical faults or sparks\nBroken locks or doors that affect security\nNo water, power, or heating in extreme weather\nFor these, contact your landlord immediately through the RenterPay emergency channel or call emergency maintenance if available.\nFor non-urgent issues like a dripping tap, noisy fan, or loose cupboard hinge, you can submit a normal maintenance request and choose a suitable service time.\n💡 Pro Tip: Label your request correctly — “Urgent” or “Routine.” This helps vendors prioritize and manage tasks efficiently.',
      'Once your request is submitted, the RenterPay app automatically updates you on every stage — from “Request Received” → “Vendor Assigned” → “In Progress” → “Completed.”You can also communicate with the vendor through in-app messaging if you need to adjust the appointment time or provide additional details.After the job is done, you\'ll receive a completion notification asking you to confirm the service. Reviewing the work ensures accountability and helps maintain quality service standards on the platform.💡 Pro Tip: If the issue reoccurs after repair, reopen the same request instead of submitting a new one — this helps maintain continuity and service history.',
      'Even though maintenance issues can be frustrating, always maintain polite and respectful communication with your landlord and service vendors. A friendly tone goes a long way in ensuring your requests are handled quickly and positively.Avoid placing blame or using harsh language — simply describe the problem and follow up if there\'s a delay. Remember, both you and your landlord want the property in good condition.💡 Pro Tip: Thank your vendor or landlord after a successful fix — small gestures build long-term trust and cooperation.',
      'Every time you submit a maintenance request, keep a copy of the communication, photos, and completion reports. The RenterPay app does this automatically in your “Maintenance History” section, but you can also export it if needed.These records are useful if you ever need to prove that you reported an issue on time — especially when moving out or during inspection reviews.',
    ];
    List infoList = [
      'Gas leaks or smell of gas',
      'Major water leaks or flooding',
      'Electrical faults or sparks',
      'Broken locks or doors that affect security',
      'No water, power, or heating in extreme weather',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        ...List.generate(titleList.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextPrimary(text: titleList[index], fontSize: 20.sp),
              CustomTextSecondary(text: subtitleList[index]),
              SizedBox(height: 12.h),
            ],
          );
        }),
        CustomTextPrimary(text: 'Know What Counts as Urgent', fontSize: 20.sp),
        CustomTextSecondary(
          text:
              'Not every maintenance issue is an emergency — but when it is, knowing how to report it correctly can make a big difference.\nEmergency issues include:',
        ),
        ...List.generate(infoList.length, (index) {
          return info(infoList[index]);
        }),
        CustomTextSecondary(text: 'For these, contact your landlord immediately through the RenterPay emergency channel or call emergency maintenance if available.For non-urgent issues like a dripping tap, noisy fan, or loose cupboard hinge, you can submit a normal maintenance request and choose a suitable service time.💡 Pro Tip: Label your request correctly — “Urgent” or “Routine.” This helps vendors prioritize and manage tasks efficiently.')
      ],
    );
  }

  Widget info(String text) {
    return Row(
      children: [
        Container(
          height: 7.h,
          width: 7.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.secondaryTextColor,
          ),
        ),
        SizedBox(width: 5.w),
        CustomTextSecondary(text: text),
      ],
    );
  }
}
