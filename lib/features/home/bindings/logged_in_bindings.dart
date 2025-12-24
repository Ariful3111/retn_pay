import 'package:get/get.dart';
import 'package:renter_pay/features/auth/bindings/user_role_binding.dart';
import 'package:renter_pay/features/chat/bindings/chat_bindings.dart';
import 'package:renter_pay/features/dashboard/bindings/dashboard_bindings.dart';
import 'package:renter_pay/features/favorite/bindings/favorite_bindings.dart';
import 'package:renter_pay/features/home/bindings/home_bindings.dart';
import 'package:renter_pay/features/home/bindings/main_home_bindings.dart';
import 'package:renter_pay/features/profile/bindings/profile_bindings.dart';
import 'package:renter_pay/features/rent/bindings/rent_bindings.dart';

class LoggedInBindings extends Bindings {
  @override
  void dependencies() {
    MainHomeBindings().dependencies();
    HomeBindings().dependencies();
    RentBindings().dependencies();
    DashboardBindings().dependencies();
    ChatBindings().dependencies();
    ProfileBindings().dependencies();
    UserRoleBinding().dependencies();
    FavoriteBindings().dependencies();
  }
}
