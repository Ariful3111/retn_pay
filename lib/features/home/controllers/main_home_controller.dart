import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/chat/views/chat_view.dart';
import 'package:renter_pay/features/dashboard/views/dashboard_view.dart';
import 'package:renter_pay/features/home/views/home_view.dart';
import 'package:renter_pay/features/profile/views/profile_view.dart';
import 'package:renter_pay/features/rent/views/rent_view.dart';

class MainHomeController extends GetxController {
  RxInt selectIndex = 0.obs;
  RxBool isVisible = true.obs;
  
   double lastOffset = 0.0;
   double minOffset = 10.0;
   Timer? timer;
  RxList pageList = [HomeView(),RentView(),DashboardView(),ChatView(),ProfileView()].obs;
  void changeIndex(int index){
    selectIndex.value = index;
    cancelTimer();
  }
  final List<Map<String,dynamic>> navItems = [
    {'icon':IconsPath.home,'label':'Home'},
    {'icon':IconsPath.rent,'label':'Rent'},
    {'icon':IconsPath.dashboard,'label':'Dashboard'},
    {'icon':IconsPath.chat,'label':'Chat'},
    {'icon':ImagesPath.profile,'label':'Profile'},
  ];

  void handleScroll(ScrollNotification notification){
    if(notification.metrics.axis !=Axis.vertical) return;
    final double current = notification.metrics.pixels;
    final double minScroll = notification.metrics.minScrollExtent;
    if(current<=minScroll+10){
      if(!isVisible.value)isVisible.value=true;
      cancelTimer();
      return;
    }
    if(current-lastOffset>minOffset){
      hideNav();
    }else if(lastOffset-current>minOffset){
      if(!isVisible.value)isVisible.value=true;
      restoreTimer();
    }
    lastOffset = current;
  }
 void hideNav(){
    if(isVisible.value)isVisible.value=false;
        cancelTimer();
  }
 void restoreTimer(){
    cancelTimer();
    timer = Timer(Duration(milliseconds: 500), (){
      if(lastOffset>50){
        hideNav();
      }
    });
  }
 void cancelTimer(){
    timer?.cancel();
    timer=null;
  }

  @override
  void onClose() {
    cancelTimer();
    super.onClose();
  }
}
