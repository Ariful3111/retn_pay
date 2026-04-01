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
  RxBool isEditable = true.obs;

  @override
  void onInit() {
    _initializeDisclosureItems();
    super.onInit();
  }

  void setIsEditable(bool value) {
    isEditable.value = value;
  }

  void populateFromDisclosures(Map<String, dynamic>? disclosures) {
    if (disclosures == null) return;

    for (int i = 0; i < disclosureItems.length; i++) {
      final item = disclosureItems[i];

      // Item 1: Intent to sell premises
      if (item.label.contains('I intend to sell')) {
        final intentToSell =
            disclosures['intent_to_sell_premises'] as Map<String, dynamic>?;
        if (intentToSell != null) {
          final intendsToSell = intentToSell['intends_to_sell'] == '1';
          disclosureItems[i].yesAnswer = intendsToSell;
          disclosureItems[i].noAnswer = !intendsToSell;

          // Additional fields for selling
          disclosureItems[i].yesAnswerA = intentToSell['engaged_agent'] == '1';
          disclosureItems[i].noAnswerA = intentToSell['engaged_agent'] == '0';
          disclosureItems[i].yesAnswerB =
              intentToSell['contract_prepared'] == '1';
          disclosureItems[i].noAnswerB =
              intentToSell['contract_prepared'] == '0';
        }
      }

      // Item 2: Mortgagee action
      if (item.label.contains('mortgagee has commenced proceedings')) {
        final mortgageeAction =
            disclosures['mortgagee_action'] as Map<String, dynamic>?;
        if (mortgageeAction != null) {
          final hasAction =
              mortgageeAction['enforcement_proceedings_commenced'] == '1';
          disclosureItems[i].yesAnswer = hasAction;
          disclosureItems[i].noAnswer = !hasAction;
        }
      }

      // Item 3/5: Ownership
      if (item.label.contains('I am not the owner') ||
          item.label.contains('I have a right to rent')) {
        final ownership = disclosures['ownership'] as Map<String, dynamic>?;
        if (ownership != null) {
          final hasRight = ownership['has_right_to_rent'] == '1';
          disclosureItems[i].yesAnswer = hasRight;
          disclosureItems[i].noAnswer = !hasRight;
        }
      }

      // Item 4: Mortgagee taking possession
      if (item.label.contains('mortgagee is taking action to possess')) {
        final mortgageeAction =
            disclosures['mortgagee_action'] as Map<String, dynamic>?;
        if (mortgageeAction != null) {
          final takingPossession =
              mortgageeAction['mortgagee_taking_possession'] == '1';
          disclosureItems[i].yesAnswer = takingPossession;
          disclosureItems[i].noAnswer = !takingPossession;
        }
      }

      // Item 5: I am the owner
      if (item.label.contains('I am the owner of the property')) {
        final ownership = disclosures['ownership'] as Map<String, dynamic>?;
        if (ownership != null) {
          final isOwner = ownership['is_owner'] == '1';
          disclosureItems[i].yesAnswer = isOwner;
          disclosureItems[i].noAnswer = !isOwner;
        }
      }

      // Item 6: Embedded electricity network
      if (item.label.contains('embedded electricity network')) {
        final embedded =
            disclosures['embedded_electricity_network']
                as Map<String, dynamic>?;
        if (embedded != null) {
          final isEmbedded = embedded['supplied_by_embedded_network'] == '1';
          disclosureItems[i].yesAnswer = isEmbedded;
          disclosureItems[i].noAnswer = !isEmbedded;
        }
      }

      // Item 7: Homicide
      if (item.label.contains('homicide in the last 5 years')) {
        final propertyHistory =
            disclosures['property_history'] as Map<String, dynamic>?;
        if (propertyHistory != null) {
          final hasHomicide =
              propertyHistory['homicide_in_last_5_years'] == '1';
          disclosureItems[i].yesAnswer = hasHomicide;
          disclosureItems[i].noAnswer = !hasHomicide;
        }
      }

      // Item 8: Rental minimum standards
      if (item.label.contains('rental minimum standards')) {
        final rentalCompliance =
            disclosures['rental_compliance'] as Map<String, dynamic>?;
        if (rentalCompliance != null) {
          final meetsStandards =
              rentalCompliance['meets_minimum_standards'] == '1';
          disclosureItems[i].yesAnswer = meetsStandards;
          disclosureItems[i].noAnswer = !meetsStandards;
        }
      }

      // Item 9: Mould or damp repair notices
      if (item.label.contains('mould or damp')) {
        final rentalCompliance =
            disclosures['rental_compliance'] as Map<String, dynamic>?;
        if (rentalCompliance != null) {
          final hasNotices =
              rentalCompliance['mould_or_damp_repair_notices_last_3_years'] ==
              '1';
          disclosureItems[i].yesAnswer = hasNotices;
          disclosureItems[i].noAnswer = !hasNotices;
        }
      }

      // Item 10: Electricity safety check date
      if (item.label.contains('electricity safety check')) {
        final safetyChecks =
            disclosures['safety_checks'] as Map<String, dynamic>?;
        if (safetyChecks != null &&
            safetyChecks['electricity_safety_check_date'] != null) {
          try {
            final dateStr =
                safetyChecks['electricity_safety_check_date'] as String;
            final parts = dateStr.split('-');
            disclosureItems[i].selectedDate = DateTime(
              int.parse(parts[0]),
              int.parse(parts[1]),
              int.parse(parts[2]),
            );
          } catch (e) {
            // Ignore parse errors
          }
        }
      }

      // Item 11: Gas safety check date
      if (item.label.contains('gas safety check')) {
        final safetyChecks =
            disclosures['safety_checks'] as Map<String, dynamic>?;
        if (safetyChecks != null &&
            safetyChecks['gas_safety_check_date'] != null) {
          try {
            final dateStr = safetyChecks['gas_safety_check_date'] as String;
            final parts = dateStr.split('-');
            disclosureItems[i].selectedDate = DateTime(
              int.parse(parts[0]),
              int.parse(parts[1]),
              int.parse(parts[2]),
            );
          } catch (e) {
            // Ignore parse errors
          }
        }
      }

      // Item 12: Pool barrier compliance check date
      if (item.label.contains('pool barrier compliance check')) {
        final safetyChecks =
            disclosures['safety_checks'] as Map<String, dynamic>?;
        if (safetyChecks != null &&
            safetyChecks['pool_barrier_compliance_check_date'] != null) {
          try {
            final dateStr =
                safetyChecks['pool_barrier_compliance_check_date'] as String;
            final parts = dateStr.split('-');
            disclosureItems[i].selectedDate = DateTime(
              int.parse(parts[0]),
              int.parse(parts[1]),
              int.parse(parts[2]),
            );
          } catch (e) {
            // Ignore parse errors
          }
        }
      }

      // Item 13: Outstanding recommendations
      if (item.label.contains('outstanding recommendations')) {
        final safetyChecks =
            disclosures['safety_checks'] as Map<String, dynamic>?;
        if (safetyChecks != null) {
          final hasOutstanding =
              safetyChecks['outstanding_recommendations'] == '1';
          disclosureItems[i].yesAnswer = hasOutstanding;
          disclosureItems[i].noAnswer = !hasOutstanding;
        }
      }

      // Item 14: Heritage listed
      if (item.label.contains('Heritage Register')) {
        final heritage = disclosures['heritage'] as Map<String, dynamic>?;
        if (heritage != null) {
          final isHeritage = heritage['is_heritage_listed'] == '1';
          disclosureItems[i].yesAnswer = isHeritage;
          disclosureItems[i].noAnswer = !isHeritage;
        }
      }

      // Item 15: Drug activity
      if (item.label.contains('trafficking or cultivation of a drug')) {
        final propertyHistory =
            disclosures['property_history'] as Map<String, dynamic>?;
        if (propertyHistory != null) {
          final hasDrugActivity =
              propertyHistory['drug_activity_in_last_5_years'] == '1';
          disclosureItems[i].yesAnswer = hasDrugActivity;
          disclosureItems[i].noAnswer = !hasDrugActivity;
        }
      }

      // Item 16: Asbestos
      if (item.label.contains('asbestos')) {
        final propertyHistory =
            disclosures['property_history'] as Map<String, dynamic>?;
        if (propertyHistory != null) {
          final hasAsbestos = propertyHistory['asbestos_present'] == '1';
          disclosureItems[i].yesAnswer = hasAsbestos;
          disclosureItems[i].noAnswer = !hasAsbestos;
        }
      }

      // Item 17: Planning application
      if (item.label.contains('building or planning application')) {
        final planningLegal =
            disclosures['planning_and_legal'] as Map<String, dynamic>?;
        if (planningLegal != null) {
          final isAffected =
              planningLegal['affected_by_planning_application'] == '1';
          disclosureItems[i].yesAnswer = isAffected;
          disclosureItems[i].noAnswer = !isAffected;
        }
      }

      // Item 18: Domestic building work dispute
      if (item.label.contains('Domestic Building Contracts Act')) {
        final planningLegal =
            disclosures['planning_and_legal'] as Map<String, dynamic>?;
        if (planningLegal != null) {
          final hasDispute =
              planningLegal['domestic_building_work_dispute'] == '1';
          disclosureItems[i].yesAnswer = hasDispute;
          disclosureItems[i].noAnswer = !hasDispute;
        }
      }

      // Item 19: Owners corporation dispute
      if (item.label.contains('Owners Corporations Act')) {
        final planningLegal =
            disclosures['planning_and_legal'] as Map<String, dynamic>?;
        if (planningLegal != null) {
          final hasDispute = planningLegal['owners_corporation_dispute'] == '1';
          disclosureItems[i].yesAnswer = hasDispute;
          disclosureItems[i].noAnswer = !hasDispute;
        }
      }

      // Item 20: Owners corporation rules
      if (item.label.contains('owners corporation rules')) {
        final planningLegal =
            disclosures['planning_and_legal'] as Map<String, dynamic>?;
        if (planningLegal != null) {
          final hasRules =
              planningLegal['subject_to_owners_corporation_rules'] == '1';
          disclosureItems[i].yesAnswer = hasRules;
          disclosureItems[i].noAnswer = !hasRules;
        }
      }
    }

    disclosureItems.refresh();
  }

  void _initializeDisclosureItems() {
    disclosureItems.value = [
      DisclosureItem(label: '1. I intend to sell the premises'),
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
