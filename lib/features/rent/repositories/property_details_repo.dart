import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';

class PropertyDetailsRepository {
  final GetNetwork getNetwork;
  const PropertyDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, PropertyDetailsModel>> execute({
    required String token,
    required String propertyID,
  }) async {
    final response = await getNetwork.getData<PropertyDetailsModel>(
      url: "/api/${NetworkLinks.version}/properties/$propertyID",
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      fromJson: (json) => PropertyDetailsModel.fromJson(json),
    );
    return response;
  }
}
