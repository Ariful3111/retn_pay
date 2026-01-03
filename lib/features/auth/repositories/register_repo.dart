import 'package:fpdart/fpdart.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/features/auth/models/register_model.dart';

class RegisterRepository {
  final PostWithResponse postWithResponse;
  const RegisterRepository({required this.postWithResponse});

  Future<Either<ErrorModel, RegisterModel>> execute({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
    required String phoneCode,
    required String emailCode,
  }) async {
    final response = await postWithResponse.postData<RegisterModel>(
      url: "/api/${NetworkLinks.version}/register",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: {
        "first_name": firstName,
        if (phoneCode.isNotEmpty) "last_name": lastName,
        if (phone.isNotEmpty) "phone": phone,
        if (email.isNotEmpty) "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "role": role,
        if (phoneCode.isNotEmpty) "phone_code": phoneCode,
        if (emailCode.isNotEmpty) "email_code": emailCode,
      },
      fromJson: (json) => RegisterModel.fromJson(json),
    );
    return response;
  }
}
