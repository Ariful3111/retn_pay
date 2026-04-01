import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisclosureItem {
  final String label;
  final String? description;
  bool yesAnswer;
  bool noAnswer;
  bool yesAnswerA;
  bool noAnswerA;
  bool yesAnswerB;
  bool noAnswerB;
  DateTime? selectedDate;
  bool hasDateField;
  bool hasAdditionalFields;
  Map<String, TextEditingController> additionalFieldsControllers;

  DisclosureItem({
    required this.label,
    this.description,
    this.yesAnswer = false,
    this.noAnswer = false,
    this.yesAnswerA = false,
    this.noAnswerA = false,
    this.yesAnswerB = false,
    this.noAnswerB = false,
    this.selectedDate,
    this.hasDateField = false,
    this.hasAdditionalFields = false,
    Map<String, TextEditingController>? additionalFieldsControllers,
  }) : additionalFieldsControllers = additionalFieldsControllers ?? {};

  void dispose() {
    for (var controller in additionalFieldsControllers.values) {
      controller.dispose();
    }
  }
}

class ApplicationManagementDetailsTableController extends GetxController {
  late RxList<DisclosureItem> disclosureItems = <DisclosureItem>[].obs;
  @override
  void onInit() {
    _initializeDisclosureItems();
    super.onInit();
  }

  void _initializeDisclosureItems() {
    disclosureItems.value = [
      DisclosureItem(
        label: '1. I intend to sell the premises',
      ),
      DisclosureItem(
        label:
            '2. A mortgagee has commenced proceedings to enforce the mortgage',
      ),
      DisclosureItem(
        label:
            '3. or I am not the owner of the property but I have a right to rent the property out',
      ),
      DisclosureItem(
        label: '4. A mortgagee is taking action to possess the premises',
      ),
      DisclosureItem(label: '5. I am the owner of the property'),
      DisclosureItem(
        label:
            '6. The premises are supplied with electricity from an embedded electricity network',
        hasAdditionalFields: true,
      ),
      DisclosureItem(
        label:
            '7. To the best of my knowledge, the property or common property has been the location of a homicide in the last 5 years',
      ),
      DisclosureItem(
        label:
            '8. The property meets the rental minimum standards. The rental minimum standards are set out at https://www.consumer.vic.gov.au/rentalstandards.',
      ),
      DisclosureItem(
        label:
            '9. In the last 3 years, I have received a repair notice(s) seeking repair of mould or damp caused by or related to the building structure. (This disclosure requirement only starts after 31 December 2021)',
      ),
      DisclosureItem(
        label:
            '10. When an electricity safety check was last conducted at the premises',
        hasDateField: true,
      ),
      DisclosureItem(
        label: '11. When a gas safety check was last conducted at the premises',
        hasDateField: true,
      ),
      DisclosureItem(
        label:
            '12. When a pool barrier compliance check was last conducted at the premises (if applicable)',
        hasDateField: true,
      ),
      DisclosureItem(
        label:
            '13. Whether there are any outstanding recommendations from the electricity or gas check',
      ),
      DisclosureItem(
        label:
            '14. The property is a heritage listed place on the Heritage Register',
      ),
      DisclosureItem(
        label:
            '15. To the best of my knowledge, the property has been used for the trafficking or cultivation of a drug of dependence in the last 5 years',
      ),
      DisclosureItem(
        label:
            '16. To the best of my knowledge, the property has asbestos (friable or non-friable) based on an inspection by a suitably qualified person',
      ),
      DisclosureItem(
        label:
            '17. To the best of my knowledge, the property is affected by a building or planning application lodged with a relevant authority',
      ),
      DisclosureItem(
        label:
            '18. There is a current domestic building work dispute under the Domestic Building Contracts Act 1995 relating to the premises',
      ),
      DisclosureItem(
        label:
            '19. There is a current dispute under Part 10 of the Owners Corporations Act 2006 which applies to or affects the premises',
      ),
      DisclosureItem(
        label:
            '20. Whether the premises is subject to any owners corporation rules (rental provider to attach the rules to this application form)',
      ),
    ];
  }

  void updateYesAnswer(int index, bool value) {
    disclosureItems[index].yesAnswer = value;
    if (value) {
      disclosureItems[index].noAnswer = false;
    }
    disclosureItems.refresh();
  }

  void updateNoAnswer(int index, bool value) {
    disclosureItems[index].noAnswer = value;
    if (value) {
      disclosureItems[index].yesAnswer = false;
    }
    disclosureItems.refresh();
  }

  void updateSelectedDate(int index, DateTime date) {
    disclosureItems[index].selectedDate = date;
    disclosureItems.refresh();
  }

  void updateYesAnswerA(int index, bool value) {
    disclosureItems[index].yesAnswerA = value;
    if (value) {
      disclosureItems[index].noAnswerA = false;
    }
    disclosureItems.refresh();
  }

  void updateNoAnswerA(int index, bool value) {
    disclosureItems[index].noAnswerA = value;
    if (value) {
      disclosureItems[index].yesAnswerA = false;
    }
    disclosureItems.refresh();
  }

  void updateYesAnswerB(int index, bool value) {
    disclosureItems[index].yesAnswerB = value;
    if (value) {
      disclosureItems[index].noAnswerB = false;
    }
    disclosureItems.refresh();
  }

  void updateNoAnswerB(int index, bool value) {
    disclosureItems[index].noAnswerB = value;
    if (value) {
      disclosureItems[index].yesAnswerB = false;
    }
    disclosureItems.refresh();
  }

  TextEditingController getAdditionalFieldController(int index, String key) {
    if (!disclosureItems[index].additionalFieldsControllers.containsKey(key)) {
      disclosureItems[index].additionalFieldsControllers[key] =
          TextEditingController();
    }
    return disclosureItems[index].additionalFieldsControllers[key]!;
  }

  @override
  void dispose() {
    for (var item in disclosureItems) {
      item.dispose();
    }
    super.dispose();
  }
}
