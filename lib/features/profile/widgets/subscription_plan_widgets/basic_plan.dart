import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/subscribe_plan_controller.dart';
import 'package:renter_pay/features/profile/models/plan_model.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/benefits_list.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class BasicPlan extends StatelessWidget {
  final Plan plan;
  final String? buttonText;
  const BasicPlan({super.key, required this.plan, this.buttonText});

  String _featureText(PlanFeature feature) {
    final title = feature.title?.trim();
    final value = feature.value?.trim();
    final list = feature.features;

    if (title == null || title.isEmpty) {
      if (value != null && value.isNotEmpty) return value;
      if (list != null && list.isNotEmpty) return list.join(', ');
      return '';
    }

    if (value != null && value.isNotEmpty) return '$title: $value';
    if (list != null && list.isNotEmpty) return '$title: ${list.join(', ')}';
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return SubscriptionContainer(
      planTitle: plan.name ?? "Basic",
      widgetList:
          plan.features
              ?.map(_featureText)
              .where((text) => text.trim().isNotEmpty)
              .map(
                (text) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: BenefitsList(listText: text),
                ),
              )
              .toList() ??
          [],
      planSubtitle:
          "(Free ${plan.trialPeriodDays ?? 0} days for first-time users)",
      price: plan.price == null ? null : '\$${plan.price}',
      spanText: plan.billingCycle == null ? null : "/${plan.billingCycle}",
      purchaseButton: Obx(() {
        return Get.find<SubscribePlanController>().isLoading.value
            ? const Center(child: ButtonLoading())
            : CustomSecondaryButton(
                onPressed: () async {
                  await Get.find<SubscribePlanController>().subscribePlan(
                    planID: plan.id ?? 0,
                  );
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return SubscriptionConfirmDialog();
                  //   },
                  // );
                },
                text: buttonText ?? "Downgrade",
                height: 52.h,
                width: 286.w,
              );
      }),
    );
  }
}
