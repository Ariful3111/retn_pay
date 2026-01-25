import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/profile/models/plan_model.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/benefits_list.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_confirm_dialog.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';

class BasicPlan extends StatelessWidget {
  final Plan plan;
  const BasicPlan({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return SubscriptionContainer(
      planTitle: plan.name ?? "Basic",
      widgetList:
          plan.features
              ?.map(
                (e) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: BenefitsList(listText: e),
                ),
              )
              .toList() ??
          [],
      planSubtitle: "(Free ${plan.trialPeriodDays} days for first-time users)",
      price: plan.price?.toString(),
      spanText: "/${plan.billingCycle!}",
      purchaseButton: CustomSecondaryButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SubscriptionConfirmDialog();
            },
          );
        },
        text: "Downgrade",
        height: 52.h,
        width: 286.w,
      ),
    );
  }
}
