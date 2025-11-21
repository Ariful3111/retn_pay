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

  List pageList = [HomeView(),RentView(),DashboardView(),ChatView(),ProfileView()];
  
  void changeIndex(int index){
    selectIndex.value = index;
  }
  

  final List<Map<String,dynamic>> navItems = [
    {'icon':IconsPath.home,'label':'Home','isColor':true},
    {'icon':IconsPath.rent,'label':'Rent','isColor':true},
    {'icon':IconsPath.dashboard,'label':'Dashboard','isColor':true},
    {'icon':IconsPath.chat,'label':'Chat','isColor':true},
    {'icon':ImagesPath.navProfile,'label':'Profile','isColor':false},
  ];

  
}
