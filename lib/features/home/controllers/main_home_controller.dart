import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/chat/views/chat_view.dart';
import 'package:renter_pay/features/dashboard/views/landlord_views/landlord_calender_view.dart';
import 'package:renter_pay/features/dashboard/views/service_vendor_views/booking_management.dart';
import 'package:renter_pay/features/dashboard/views/tenant_views/dashboard_view.dart';
import 'package:renter_pay/features/home/views/home_view.dart';
import 'package:renter_pay/features/profile/views/profile_view.dart';
import 'package:renter_pay/features/rent/views/rent_view.dart';

class MainHomeController extends GetxController {
  RxInt selectIndex = 0.obs;

  List<Widget> pageList = [
   userIndex==0? HomeView():DashboardView(),
   userIndex==3?BookingManagement() :RentView(),
   userIndex==0? DashboardView():ChatView(),
   userIndex==0? ChatView():LandlordCalenderView(),
    ProfileView(),
  ];

  void changeIndex(int index) {
    selectIndex.value = index;
  }

  final List<Map<String, dynamic>> navItems = [
    {'icon':userIndex==1||userIndex==2||userIndex==3?IconsPath.dashboard :IconsPath.home, 'label':userIndex==1||userIndex==2||userIndex==3? 'Dashboard' :'Home', 'isColor': true},
    {'icon':userIndex==3? IconsPath.drawerBook:IconsPath.rent, 'label':userIndex==3? 'Booking':'Rent', 'isColor': true},
    {'icon':userIndex==1||userIndex==2||userIndex==3?IconsPath.chat :IconsPath.dashboard, 'label':userIndex==1||userIndex==2||userIndex==3? 'Chat':'Dashboard', 'isColor': true},
    {'icon':userIndex==1||userIndex==2||userIndex==3?IconsPath.dashboardCalender: IconsPath.chat, 'label':userIndex==1||userIndex==2||userIndex==3?'Calender': 'Chat', 'isColor': true},
    {'icon': ImagesPath.navProfile, 'label': 'Profile', 'isColor': false},
  ];
}
