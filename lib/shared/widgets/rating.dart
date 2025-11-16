import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class Rating extends StatelessWidget {
  final ValueChanged<double> onRating;
  final double initialRating;
  const Rating({super.key, required this.onRating, required this.initialRating});
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      minRating: 1,
      initialRating: initialRating,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 12.sp,
      itemPadding: EdgeInsetsGeometry.all(1.sp),
      itemBuilder: (_, _) {
        return Image.asset(IconsPath.rating);
      },
      onRatingUpdate: onRating,
    );
  }
}
