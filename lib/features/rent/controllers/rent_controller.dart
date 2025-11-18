import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RentController extends GetxController{
  Rx<SfRangeValues> range = SfRangeValues(300, 670000).obs;
  double minRange = 0;
  double maxRange = 700000;
  TextEditingController filterSearchController = TextEditingController();
  RxList<String> selectedFilterProperty = <String>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;
  RxList apartmentRating = List<double>.filled(12,1.0).obs;
  RxList houseRating = List<double>.filled(12,1.0).obs;
  RxList officeRating = List<double>.filled(12,1.0).obs;
  RxList studioRating = List<double>.filled(12,1.0).obs;
  RxList vilaRating = List<double>.filled(12,1.0).obs;
}