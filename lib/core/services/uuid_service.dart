import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:uuid/uuid.dart';

class UuidService {
  final StorageService storageService;
  final Uuid _uuid;

  UuidService({required this.storageService, Uuid? uuid})
    : _uuid = uuid ?? const Uuid();

  Future<String> createAndSaveUuidToStorage() async {
    final id = _uuid.v4();
    await storageService.write(key: storageService.deviceIDKey, value: id);
    return id;
  }

  Future<String> getUuidFromStorage() async {
    final existing = storageService.read<String>(
      key: storageService.deviceIDKey,
    );
    if (existing != null && existing.trim().isNotEmpty) {
      return existing;
    }

    return await createAndSaveUuidToStorage();
  }
}
