import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class AddNewPropertyInfoImages extends StatelessWidget {
  const AddNewPropertyInfoImages({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 173 / 173,
      ),
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.38.r),
            image: DecorationImage(
              image: AssetImage(ImagesPath.vila),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
