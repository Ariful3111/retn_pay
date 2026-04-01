import 'package:flutter/material.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';

class ApplicationManagementDetailsPartAProvider extends StatelessWidget {
  const ApplicationManagementDetailsPartAProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBulletPointText(
      items: [
        'Rental auctions are prohibited under law. You may be fined if you invite prospective renters to offer more than the advertised rent.',
        'You are required to include \'Part B - Statement of information for rental applicants\' in all applications for rental agreements.',
        'You are required to disclose particular information about your rental property before a potential renter enters into a rental agreement with you. You must complete \'Part C - Mandatory disclosures checklist\' of this form before giving this form to an applicant to meet your obligations. You may be fined if you fail to do this.',
        'You cannot charge fees for this application.',
        'The personal information provided in this form is confidential. You must not use the information other than to assess whether the applicant is suitable for the property.',
        'Before the successful renter moves in, you must give them 2 signed copies of the Condition report in the required form specifying the state of repair and general condition of the premises on the day specified in the report. This can be provided electronically. You may be fined if you fail do this.',
        'If the application is unsuccessful, this form and any copies should be destroyed.',
      ],
    );
  }
}
