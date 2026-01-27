import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';

class GetPropertiesRepository {
  final GetNetwork getNetwork;
  const GetPropertiesRepository({required this.getNetwork});
  Future<Either<ErrorModel, PropertiesModel>> execute({
    required String token,
    String? perPage,
    String? status,
    String? type,
    String? amenities,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? bedrooms,
    String? bathrooms,
    String? parkingSpaces,
    String? landSizeMin,
    String? landSizeMax,
    String? buildingSizeMin,
    String? buildingSizeMax,
    String? yearBuiltMin,
    String? yearBuiltMax,
    String? isVerified,
    String? hasARTour,
    String? ratingMin,
    String? priceMin,
    String? priceMax,
    String? search,
  }) async {
    final basePath = "/api/${NetworkLinks.version}/properties";
    final queryParams = <String, String>{};
    void addParam({required String key, String? value}) {
      if (value != null && value.isNotEmpty) {
        queryParams[key] = value;
      }
    }

    addParam(key: "per_page", value: perPage);
    addParam(key: "status", value: status);
    addParam(key: "type", value: type);
    addParam(key: "amenities", value: amenities);
    addParam(key: "city", value: city);
    addParam(key: "state", value: state);
    addParam(key: "postal_code", value: postalCode);
    addParam(key: "country", value: country);
    addParam(key: "bedrooms", value: bedrooms);
    addParam(key: "bathrooms", value: bathrooms);
    addParam(key: "parking_spaces", value: parkingSpaces);
    addParam(key: "land_size_min", value: landSizeMin);
    addParam(key: "land_size_max", value: landSizeMax);
    addParam(key: "building_size_min", value: buildingSizeMin);
    addParam(key: "building_size_max", value: buildingSizeMax);
    addParam(key: "year_built_min", value: yearBuiltMin);
    addParam(key: "year_built_max", value: yearBuiltMax);
    addParam(key: "is_verified", value: isVerified);
    addParam(key: "has_ar_tour", value: hasARTour);
    addParam(key: "rating_min", value: ratingMin);
    addParam(key: "price_min", value: priceMin);
    addParam(key: "price_max", value: priceMax);
    addParam(key: "search", value: search);
    final uri = Uri.parse(
      basePath,
    ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);
    final response = await getNetwork.getData<PropertiesModel>(
      url: uri.toString(),
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
      fromJson: (json) => PropertiesModel.fromJson(json),
    );
    return response;
  }
}
