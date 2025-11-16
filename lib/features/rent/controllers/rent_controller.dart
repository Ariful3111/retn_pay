import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RentController extends GetxController{
  Rx<SfRangeValues> range = SfRangeValues(300, 670000).obs;
  double minRange = 0;
  double maxRange = 700000;
  TextEditingController filterSearchController = TextEditingController();
}