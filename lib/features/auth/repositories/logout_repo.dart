import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class LogoutRepository {
  final PostWithoutResponse postWithoutResponse;
  const LogoutRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({required String token}) async {
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/logout",
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      body: {},
    );
    return response;
  }
}
