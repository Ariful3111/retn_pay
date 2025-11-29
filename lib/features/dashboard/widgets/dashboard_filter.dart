import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardFilter extends StatelessWidget {
  const DashboardFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.8, -0.6),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: 260.w,
        ),
      ),
    );
  }
}
