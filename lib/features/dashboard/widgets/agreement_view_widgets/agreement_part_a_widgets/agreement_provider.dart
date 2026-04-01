import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementProvider extends StatelessWidget {
  final AgreementPartAController controller = Get.find();
  final AgreementHelper _helper = AgreementHelper();

  AgreementProvider({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rental Provider Details Section
          _buildRentalProviderSection(isDark),
          SizedBox(height: 24.h),

          // Rental Provider Details Note
          CustomTextSecondary(
            text:
                'Please fill out details below where no agent is acting for the rental provider',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            softWrap: true,
          ),
          SizedBox(height: 16.h),

          // Rental Provider Contact Details
          _buildContactDetailsSection(isDark),
          SizedBox(height: 24.h),

          // Agent Details Section
          _buildAgentDetailsSection(isDark),
          SizedBox(height: 16.h),

          // Note
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Note: ',
                  style: TextStyle(
                    color: const Color(0xFF091E42),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text:
                      'The rental provider must notify the renter within 7 days if any of this information changes.',
                  style: TextStyle(
                    color: const Color(0xFF091E42),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Rental Provider Section
  Widget _buildRentalProviderSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _helper.agreementField(
          label: 'Full name(s) or Company name',
          controller: controller.rentalProviderNameController,
          isDark: isDark,
        ),
        _helper.agreementField(
          label: 'ABN (if applicable)',
          controller: controller.rentalProviderABNController,
          isDark: isDark,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  // Contact Details Section (Address, Postcode, Phone, Email)
  Widget _buildContactDetailsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _helper.agreementField(
          label: 'Address',
          controller: controller.rentalProviderAddressController,
          isDark: isDark,
          maxLines: 2,
        ),
        _helper.agreementField(
          label: 'Postcode',
          controller: controller.rentalProviderPostcodeController,
          isDark: isDark,
          keyboardType: TextInputType.number,
        ),
        _helper.agreementField(
          label: 'Phone number',
          controller: controller.rentalProviderPhoneController,
          isDark: isDark,
          keyboardType: TextInputType.phone,
        ),
        _helper.agreementField(
          label: 'Email address',
          controller: controller.rentalProviderEmailController,
          isDark: isDark,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  // Agent Details Section
  Widget _buildAgentDetailsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(
          text: "Rental provider's agent's details (if applicable)",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 16.h),
        _helper.agreementField(
          label: 'Full name',
          controller: controller.agentNameController,
          isDark: isDark,
        ),
        _helper.agreementField(
          label: 'Address',
          controller: controller.agentAddressController,
          isDark: isDark,
          maxLines: 2,
        ),
        _helper.agreementField(
          label: 'Postcode',
          controller: controller.agentPostcodeController,
          isDark: isDark,
          keyboardType: TextInputType.number,
        ),
        _helper.agreementField(
          label: 'Phone number',
          controller: controller.agentPhoneController,
          isDark: isDark,
          keyboardType: TextInputType.phone,
        ),
        _helper.agreementField(
          label: 'Email address',
          controller: controller.agentEmailController,
          isDark: isDark,
          keyboardType: TextInputType.emailAddress,
        ),
        _helper.agreementField(
          label: 'ABN (if applicable)',
          controller: controller.agentABNController,
          isDark: isDark,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
