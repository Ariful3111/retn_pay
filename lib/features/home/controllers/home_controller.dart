import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class HomeController extends GetxController{
  TextEditingController searchController = TextEditingController();
  RxBool isSelectedCategory = false.obs;
  final List<Map<String,dynamic>> categoryList=[
    {'category':'All','image':ImagesPath.allCategory},
    {'category':'House','image':ImagesPath.houseCategory},
    {'category':'Apartment','image':ImagesPath.apartmentCategory},
    {'category':'Vila','image':ImagesPath.vilaCategory},
    {'category':'Office','image':ImagesPath.officeCategory},
    {'category':'Studio Apartment','image':ImagesPath.studioCategory},
  ];
}