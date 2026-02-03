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

String roleForApiFromUserIndex(int index) {
  switch (index) {
    case 0:
      return 'tenant';
    case 1:
      return 'landlord';
    case 2:
      return 'agent';
    case 3:
      return 'service_vendor';
    default:
      return 'tenant';
  }
}

String normalizeRoleForApi(String? role) {
  final normalized = role
      ?.trim()
      .toLowerCase()
      .replaceAll('_', '-')
      .replaceAll(' ', '-');
  switch (normalized) {
    case 'service-vendor':
      return 'service_vendor';
    case 'tenant':
    case 'landlord':
    case 'agent':
      return normalized!;
    default:
      return roleForApiFromUserIndex(userIndex);
  }
}

String currentUserRoleForApi() {
  final storage = Get.find<StorageService>();
  final role = storage.read<String>(key: storage.roleKey);
  if (role == null || role.trim().isEmpty) {
    return roleForApiFromUserIndex(userIndex);
  }
  return normalizeRoleForApi(role);
}

void setUserIndexFromRole(String? role) {
  userIndex = userIndexFromRole(role);
}

Future<void> initUserIndexFromStorage() async {
  final storage = Get.find<StorageService>();
  final role = storage.read<String>(key: storage.roleKey);
  setUserIndexFromRole(role);
}
