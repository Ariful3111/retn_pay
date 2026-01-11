import 'package:flutter/material.dart';
import 'package:renter_pay/features/dashboard/widgets/payment_management_widgets/payment_management_filter.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentManagementFilter(),
      ],
    );
  }
}
