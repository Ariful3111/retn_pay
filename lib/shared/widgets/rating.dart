import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class Rating extends StatelessWidget {
  final VoidCallback onRating;
  const Rating({super.key, required this.onRating});
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
                    minRating: 1,
                    initialRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 12.sp,
                    itemPadding: EdgeInsetsGeometry.all(1.sp),
                    itemBuilder: (_,_) {
                      return Image.asset(IconsPath.rating);
                    },
                    onRatingUpdate: (rating){
                      OnTap;
                    },
                  );
  }
}