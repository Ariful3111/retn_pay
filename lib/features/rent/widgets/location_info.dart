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
    final data = propertyDetails.data;
    if (data == null) {
      return SizedBox();
    }
    final lat = double.tryParse(data.latitude ?? '0') ?? 0;
    final lng = double.tryParse(data.longitude ?? '0') ?? 0;
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
            lat,
            lng,
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
                  lat,
                  lng,
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
