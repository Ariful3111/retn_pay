import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final String ? image;
  const CustomRatingBar({super.key, required this.rating, this.image});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
              rating: rating,
              itemCount: 5,
              itemSize: 20.sp,
              itemPadding: EdgeInsets.all(2.r),
              itemBuilder: (_, _) {
                return Image.asset(image?? IconsPath.rating);
              },
            );
  }
}