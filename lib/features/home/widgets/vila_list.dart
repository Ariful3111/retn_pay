import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/item_container.dart';

class VilaList extends StatelessWidget {
  const VilaList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 288.h,
      width: 300.w,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_,index){
        return ItemContainer(imageHeight: 220.h, imageWidth: 300.w, image: ImagesPath.vila, padding: EdgeInsetsGeometry.only(right: 12.w), onVR: () {  },);
      }),
    );
  }
}