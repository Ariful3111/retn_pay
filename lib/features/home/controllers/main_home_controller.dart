import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/chat/views/chat_view.dart';
import 'package:renter_pay/features/dashboard/views/dashboard_view.dart';
import 'package:renter_pay/features/home/views/home_view.dart';
import 'package:renter_pay/features/profile/views/profile_view.dart';
import 'package:renter_pay/features/rent/views/rent_view.dart';

class MainHomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxInt selectIndex = 0.obs;
  RxBool isVisible = true.obs;
  Timer? timer;
  RxList pageList = [HomeView(),RentView(),DashboardView(),ChatView(),ProfileView()].obs;
  void changeIndex(int index){
    selectIndex.value = index;
  }
  void listen(){
    final direction = scrollController.position.userScrollDirection;
    timer?.cancel();
    if(direction == ScrollDirection.forward){
      if (!isVisible.value) isVisible.value = true;
    }else if(direction == ScrollDirection.reverse){
      if (isVisible.value) isVisible.value = false;
    }
    timer = Timer(const Duration(milliseconds: 500), () {
      if (scrollController.hasClients) {
        final offset = scrollController.offset;
        if (offset > 50 && isVisible.value) {
          isVisible.value = false;
        }
      }
    });
  }

  final List<Map<String,dynamic>> navItems = [
    {'icon':IconsPath.home,'label':'Home','isColor':true},
    {'icon':IconsPath.rent,'label':'Rent','isColor':true},
    {'icon':IconsPath.dashboard,'label':'Dashboard','isColor':true},
    {'icon':IconsPath.chat,'label':'Chat','isColor':true},
    {'icon':ImagesPath.navProfile,'label':'Profile','isColor':false},
  ];

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(listen);
  }
@override
  void onClose() {
    timer!.cancel();
    super.onClose();
  }
  @override
  void dispose() {
     scrollController.dispose();
     scrollController.removeListener(listen);
    super.dispose();
  }
}
