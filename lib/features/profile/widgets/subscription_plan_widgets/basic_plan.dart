import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/current_plan_model.dart'
    as current_plan;
import 'package:renter_pay/features/profile/controllers/subscribe_plan_controller.dart';
import 'package:renter_pay/features/profile/models/plan_model.dart' as plan;
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/benefits_list.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class BasicPlan extends StatelessWidget {
  final plan.Plan? planData;
  final current_plan.CurrentSubscription? currentSubscription;
  final String? buttonText;
  final bool? isCurrent;
  const BasicPlan({
    super.key,
    this.planData,
    this.currentSubscription,
    this.buttonText,
    this.isCurrent,
  }) : assert(
         planData != null || currentSubscription != null,
         'Either planData or currentSubscription must be provided',
       );

  // Helper to get plan name
  String get _planName =>
      planData?.name ?? currentSubscription?.plan?.name ?? "Basic";

  // Helper to get plan ID
  int get _planId => planData?.id ?? currentSubscription?.planId ?? 0;

  // Helper to get trial days
  int get _trialDays =>
      planData?.trialPeriodDays ??
      currentSubscription?.plan?.trialPeriodDays ??
      0;

  // Helper to get price
  num? get _price => planData?.price ?? currentSubscription?.plan?.price;

  // Helper to get billing cycle
  String? get _billingCycle =>
      planData?.billingCycle ?? currentSubscription?.plan?.billingCycle;

  // Helper to get features list as strings
  List<String> get _featureStrings {
    final featureList = <String>[];

    // Get features from Plan model
    if (planData?.features != null) {
      for (final feature in planData!.features!) {
        featureList.add(_featureTextFromPlan(feature));
      }
    }

    // Get features from CurrentSubscription model
    if (currentSubscription?.plan?.features != null) {
      for (final feature in currentSubscription!.plan!.features!) {
        featureList.add(_featureTextFromCurrent(feature));
      }
    }

    return featureList.where((text) => text.trim().isNotEmpty).toList();
  }

  String _featureTextFromPlan(plan.PlanFeature feature) {
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

  String _featureTextFromCurrent(current_plan.PlanFeature feature) {
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
      planTitle: _planName,
      widgetList: _featureStrings
          .map(
            (text) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: BenefitsList(listText: text),
            ),
          )
          .toList(),
      planSubtitle: "(Free $_trialDays days for first-time users)",
      price: _price == null ? null : '\$$_price',
      spanText: _billingCycle == null ? null : "/$_billingCycle",
      purchaseButton: Obx(() {
        return Get.find<SubscribePlanController>().isLoading.value
            ? const Center(child: ButtonLoading())
            : CustomSecondaryButton(
                onPressed: isCurrent == true
                    ? () {}
                    : () async {
                        await Get.find<SubscribePlanController>().subscribePlan(
                          planID: _planId,
                        );
                      },
                text: buttonText ?? "Downgrade",
                height: 52.h,
                width: 286.w,
              );
      }),
    );
  }
}
