import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class SignatureField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  const SignatureField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 17.w,
      top: 137.h,
      right: 17.h,
      child: SizedBox(
        height: 80.h,
        width: MediaQuery.widthOf(context),
        child: CustomTextField(
          controller: controller,
          onChanged: onChanged,
          labelText: 'Type Your Signature Here',
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: GestureDetector(
              onTap: onClear,
              child: Image.asset(
                IconsPath.close,
                height: 12.h,
                width: 12.w,
                color: Color(0xFF251621),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
