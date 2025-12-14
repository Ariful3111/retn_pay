import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomRatingBuilder extends StatelessWidget {
  final ValueChanged<double> onRating;
  final double initialRating;
  final double? itemSize;
  final Widget Function(BuildContext, int)? itemBuilder;
  const CustomRatingBuilder({
    super.key,
    required this.onRating,
    required this.initialRating,
    this.itemSize, this.itemBuilder,
  });
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      minRating: 1,
      initialRating: initialRating,
      direction: Axis.horizontal,
      itemCount: 5, 
      itemSize: itemSize ?? 12.sp,
      itemPadding: EdgeInsetsGeometry.all(1.sp),
      itemBuilder:itemBuilder?? (_, _) {
        return Image.asset(IconsPath.rating);
      },
      onRatingUpdate: onRating,
    );
  }
}
