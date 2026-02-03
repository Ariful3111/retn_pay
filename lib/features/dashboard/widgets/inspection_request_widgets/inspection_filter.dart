import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';

class InspectionFilter extends StatelessWidget {
  const InspectionFilter({super.key});
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerRight,
      child: MenuAnchor(
        builder: (context, controller, child) {
          return CustomFilterAppbar(
            height: 32.h,
            width: 71.w,
            onTap: () {
              controller.isOpen ? controller.close() : controller.open();
            },
          );
        },
        alignmentOffset: Offset(-40, 0),
        style: MenuStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        controller: MenuController(),
        menuChildren: [
          // InspectionFilterType(),
        ],
      ),
    );
  }
}
