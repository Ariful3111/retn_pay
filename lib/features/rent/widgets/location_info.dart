import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:renter_pay/core/constants/colors.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({super.key});

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
          initialCenter: LatLng(23.7516, 90.3943),
          initialZoom: 13,
          interactionOptions: InteractionOptions(flags: InteractiveFlag.all),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.example.project",
          ),
          MarkerLayer(markers: [
            Marker(
          point: LatLng(23.7516, 90.3943),
          
           child: Icon(Icons.location_on_outlined,size: 50.sp,color: AppColors.primaryColorDark,),),
          ])
        ]),
    );
  }
}