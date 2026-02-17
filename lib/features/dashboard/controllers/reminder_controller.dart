import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/reminder_model.dart';
import 'package:renter_pay/features/dashboard/repositories/reminder_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ReminderController extends GetxController {
  final ReminderRepository reminderRepository;
  ReminderController({required this.reminderRepository});

  final reminders = Rxn<ReminderModel>();
  RxBool isLoading = true.obs;

  Future<void> getReminders() async {
    isLoading.value = true;
    final response = await reminderRepository.execute(perPage: 20);
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        reminders.value = data;
      },
    );
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getReminders();
  }
}
