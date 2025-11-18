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
  RxList apartmentRating = List<double>.filled(10,1.0).obs;
  RxList<double> houseRating = <double>[].obs;
  RxList officeRating = List<double>.filled(10,1.0).obs;
  RxList studioRating = List<double>.filled(10,1.0).obs;
  RxList vilaRating = List<double>.filled(10,1.0).obs;
  int itemPerPage = 12;
  List totalItem = List.generate(100, (index) => 'Item ${index + 1}');
  RxInt currentPage = 1.obs;
  RxList currentItems =<dynamic>[].obs;
  int get totalPage =>(totalItem.length/itemPerPage).ceil();
  void updateCurrentItems() {
    currentItems.value = totalItem.sublist(startIndex, endIndex);
    // currentItems.value = List.generate(endIndex - startIndex, (index) {
    //   int globalIndex = startIndex + index;
    //   if (houseRating.length <= globalIndex) {
    //     houseRating.add(1.0); 
    //   }
    //   return 'Item ${globalIndex + 1}';
    // });
  }
  void previousPage(){
    if(currentPage.value>1) currentPage.value--;
    updateCurrentItems();
  }

  void nextPage(){
    if(currentPage.value<totalPage)currentPage.value++;
    updateCurrentItems();
  }

  void gotoPage(int page){
    if(page>=1&&page<=totalPage)currentPage.value=page;
    updateCurrentItems();
  }
  @override
  void onInit() {
    updateCurrentItems();
    super.onInit();
  }
  int get startIndex=> (currentPage.value-1)*itemPerPage;
  int get endIndex =>(startIndex+itemPerPage>totalItem.length)?totalItem.length:startIndex+itemPerPage;
}