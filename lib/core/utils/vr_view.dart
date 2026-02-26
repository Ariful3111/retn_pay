import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class VRView extends StatelessWidget {
  const VRView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Center(
        child: PanoramaViewer(
          child: Image.file(File(Get.arguments.toString()), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
