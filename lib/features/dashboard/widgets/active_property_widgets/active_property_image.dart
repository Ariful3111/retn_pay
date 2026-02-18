import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class ActivePropertyImage extends StatelessWidget {
  final List<Images> images;
  const ActivePropertyImage({super.key, this.images = const []});

  @override
  Widget build(BuildContext context) {
    final list = images;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 190 / 140,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.isEmpty ? 4 : list.length,
      itemBuilder: (BuildContext context, int index) {
        final url = list.isEmpty ? '' : (list[index].imagePath ?? '').trim();
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.79.r),
            image: DecorationImage(
              image: url.isEmpty
                  ? AssetImage(ImagesPath.apartment)
                  : CachedNetworkImageProvider(url),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
