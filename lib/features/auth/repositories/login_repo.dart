import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/features/auth/models/login_model.dart';

class LoginRepository {
  final PostWithResponse postWithResponse;
  const LoginRepository({required this.postWithResponse});

  Future<Either<ErrorModel, LoginModel>> execute({
    required String email,
    required String password,
  }) async {
    final response = await postWithResponse.postData<LoginModel>(
      url: "/api/${NetworkLinks.version}/login",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: {"id": email, "password": password},
      fromJson: (json) => LoginModel.fromJson(json),
    );
    return response;
  }
}
