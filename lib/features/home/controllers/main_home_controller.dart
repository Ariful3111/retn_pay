import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/chat/views/chat_view.dart';
import 'package:renter_pay/features/dashboard/views/dashboard_view.dart';
import 'package:renter_pay/features/home/views/home_view.dart';
import 'package:renter_pay/features/profile/views/profile_view.dart';
import 'package:renter_pay/features/rent/views/rent_view.dart';

class MainHomeController extends GetxController {
  RxInt selectIndex = 0.obs;
  RxList pageList = [HomeView(),RentView(),DashboardView(),ChatView(),ProfileView()].obs;
  void changeIndex(int index){
    selectIndex.value = index;
  }

  final List<Map<String,dynamic>> navItems = [
    {'icon':IconsPath.home,'label':'Home'},
    {'icon':IconsPath.rent,'label':'Rent'},
    {'icon':IconsPath.dashboard,'label':'Dashboard'},
    {'icon':IconsPath.chat,'label':'Chat'},
    {'icon':'profile','label':'Profile'},
  ];
}
