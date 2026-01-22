import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';

class LocationInfo extends StatelessWidget {
  final PropertyDetailsModel propertyDetails;
  const LocationInfo({super.key, required this.propertyDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.74.r),
        color: AppColors.darkPrimary.withValues(alpha: 0.10),
      ),
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(
            double.tryParse(propertyDetails.data!.latitude ?? '0') ?? 0,
            double.tryParse(propertyDetails.data!.longitude ?? '0') ?? 0,
          ),
          initialZoom: 13,
          interactionOptions: InteractionOptions(flags: InteractiveFlag.all),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.renter_pay.app",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  double.tryParse(propertyDetails.data!.latitude ?? '0') ?? 0,
                  double.tryParse(propertyDetails.data!.longitude ?? '0') ?? 0,
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  size: 50.sp,
                  color: AppColors.primaryColorDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
