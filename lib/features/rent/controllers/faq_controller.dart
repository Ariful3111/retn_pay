import 'package:get/get.dart';
import 'package:renter_pay/features/rent/models/faq_model.dart';
import 'package:renter_pay/features/rent/repositories/faq_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class FAQController extends GetxController {
  final FAQRepository faqRepository;
  FAQController({required this.faqRepository});
  RxBool isLoading = false.obs;
  final faqs = Rxn<FAQModel>();
  RxList<int> expendedIDs = <int>[].obs;

  Future<void> getFAQs({required String type}) async {
    expendedIDs.clear();
    isLoading.value = true;
    final response = await faqRepository.execute(type: type);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        faqs.value = data;
      },
    );
  }

  void toggleExpend({required int id}) {
    if (expendedIDs.contains(id)) {
      expendedIDs.remove(id);
    } else {
      expendedIDs.add(id);
    }
  }
}
