import 'package:get/get.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';

final List<Map<String, dynamic>> categoryList = [
  {'category': 'All', 'image': ImagesPath.allCategory},
  {'category': 'House', 'image': ImagesPath.houseCategory},
  {'category': 'Apartment', 'image': ImagesPath.apartmentCategory},
  {'category': 'Vila', 'image': ImagesPath.vilaCategory},
  {'category': 'Office', 'image': ImagesPath.officeCategory},
  {'category': 'Studio Apartment', 'image': ImagesPath.studioCategory},
];

final amenityMap = <String, Map<String, dynamic>>{
  'pool': {'icon': IconsPath.swimming, 'title': 'Swimming Pool'},
  'gym': {'icon': IconsPath.gym, 'title': 'Gym & Fitness Center'},
  'garden': {'icon': IconsPath.homeGarden, 'title': 'Garden & Outdoor Space'},
  'parking': {'icon': IconsPath.carParking, 'title': 'Private Parking'},
  'security': {'icon': IconsPath.security, 'title': '24/7 Security'},
  'shopping': {'icon': IconsPath.store, 'title': 'Nearby Shopping'},
  'school': {'icon': IconsPath.school, 'title': 'Close to Schools'},
  'restaurant': {'icon': IconsPath.restaurant, 'title': 'Nearby Restaurants'},
  'air_conditioning': {'icon': IconsPath.ac, 'title': 'AC Facilities'},
  'pet_friendly': {'icon': IconsPath.pet, 'title': 'Pet Allowance'},
  'wifi': {'icon': IconsPath.security, 'title': 'High-speed Internet'},
};

final RxInt _userIndexRx = 0.obs;

int get userIndex => _userIndexRx.value;
set userIndex(int value) => _userIndexRx.value = value;

int userIndexFromRole(String? role) {
  final normalized = role
      ?.trim()
      .toLowerCase()
      .replaceAll('_', '-')
      .replaceAll(' ', '-');
  switch (normalized) {
    case 'tenant':
      return 0;
    case 'landlord':
      return 1;
    case 'agent':
      return 2;
    case 'service-vendor':
      return 3;
    default:
      return 0;
  }
}

void setUserIndexFromRole(String? role) {
  userIndex = userIndexFromRole(role);
}

Future<void> initUserIndexFromStorage() async {
  final storage = Get.find<StorageService>();
  final role = storage.read<String>(key: storage.roleKey);
  setUserIndexFromRole(role);
}
