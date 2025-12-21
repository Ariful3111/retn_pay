import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class ActivePropertyImage extends StatelessWidget {
  const ActivePropertyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 190 / 140,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.79.r),
            image: DecorationImage(
              image: AssetImage(ImagesPath.apartment),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
