import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/rent/models/faq_model.dart';

class FAQRepository {
  final GetNetwork getNetwork;
  const FAQRepository({required this.getNetwork});

  Future<Either<ErrorModel, FAQModel>> execute({required String type}) async {
    final response = await getNetwork.getData<FAQModel>(
      url: "/api/${NetworkLinks.version}/faqs?type=$type",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => FAQModel.fromJson(json),
    );
    return response;
  }
}
