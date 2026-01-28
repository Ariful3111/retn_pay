import 'package:get/get.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';

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
      return 2;
    case 'landlord':
      return 2;
    case 'agent':
      return 2;
    case 'service-vendor':
      return 2;
    default:
      return 2;
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
