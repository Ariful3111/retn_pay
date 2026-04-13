import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/utils/payment_webview.dart';

class EwayPaymentService {
  static void launchPaymentGateway({
    required String paymentUrl,
    VoidCallback? onSuccess,
    VoidCallback? onCancel,
  }) {
    Get.to(
      () => PaymentWebView(
        paymentUrl: paymentUrl,
        onSuccess: onSuccess,
        onCancel: onCancel,
      ),
      fullscreenDialog: true,
      transition: Transition.rightToLeft,
    );
  }
}
