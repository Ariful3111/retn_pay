import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/customer_review.dart';

class ServiceSearchReview extends StatelessWidget {
  const ServiceSearchReview({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceDetailsContainer(
      padding: EdgeInsets.only(top: 12.h),
      child: CustomerReview(),
    );
  }
}
