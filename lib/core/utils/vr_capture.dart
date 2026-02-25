// landlord_capture_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_panorama/flutter_panorama.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/vr_controller.dart';

class VRCaptureScreen extends GetView<VrController> {
  const VRCaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PanoramaCreator(
      displayStatus: true,
      backgroundColor: Colors.black,
      loadingWidget: const CircularProgressIndicator(color: Colors.white),
      onError: (error) {
        controller.onError(error: error);
      },
      onSuccess: (panoramaPath) {
        controller.onSuccess(path: panoramaPath);
      },
      startWidget: const Icon(
        Icons.play_circle_fill_rounded,
        size: 70,
        color: Colors.white,
      ),
      stopWidget: const Icon(
        Icons.stop_circle_outlined,
        size: 70,
        color: Colors.white,
      ),
    );
  }
}
