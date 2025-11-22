import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class NotificationController extends GetxController{
  RxInt isSelected = (-1).obs;
  void selectItem(int index){
    isSelected.value = index;
  }
  List iconList = [
    IconsPath.notificationPost,
    IconsPath.favorite,
    IconsPath.notificationShare,
    IconsPath.notificationBookmark
  ];
  List textList = [
    'Emily commented on your post: "This\nskincare routine is a game-changer!...',
    'Emily commented on your post: "This\nskincare routine is a game-changer!...',
    'Emily commented on your post: "This\nskincare routine is a game-changer!...',
    'Emily commented on your post: "This\nskincare routine is a game-changer!...',
  ];
  List timeList=[
    '10m ago',
    '1h ago',
    '2h ago',
    '3h ago',
  ];
}