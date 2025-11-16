import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeController extends GetxController{
  TextEditingController searchController = TextEditingController();
  RxInt selectedCategory = (-1).obs;
  RxList apartmentRating = List<double>.filled(10,1.0).obs;
  RxList houseRating = List<double>.filled(10,1.0).obs;
  RxList officeRating = List<double>.filled(10,1.0).obs;
  RxList studioRating = List<double>.filled(10,1.0).obs;
  RxList vilaRating = List<double>.filled(10,1.0).obs;
  Rx<SfRangeValues> range = SfRangeValues(300, 670000).obs;
  double minRange = 0;
  double maxRange = 700000;
  TextEditingController filterSearchController = TextEditingController();
  final List<Map<String,dynamic>> categoryList=[
    {'category':'All','image':ImagesPath.allCategory},
    {'category':'House','image':ImagesPath.houseCategory},
    {'category':'Apartment','image':ImagesPath.apartmentCategory},
    {'category':'Vila','image':ImagesPath.vilaCategory},
    {'category':'Office','image':ImagesPath.officeCategory},
    {'category':'Studio Apartment','image':ImagesPath.studioCategory},
  ];

  @override
  void onInit() {
    apartmentRating;
    houseRating;
    studioRating;
    officeRating;
    vilaRating;
    super.onInit();
  }
}