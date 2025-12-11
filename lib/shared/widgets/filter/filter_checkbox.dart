import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class FilterCheckbox extends StatelessWidget {
  final List propertyItems;
  final RxList<String> selectedProperty;
  final Function(List<String>) onChange;
  const FilterCheckbox({
    super.key,
    required this.propertyItems,
    required this.selectedProperty,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: propertyItems.length,
      itemBuilder: (_, index) {
        final title = propertyItems[index];
        return Row(
          children: [
            Obx(() {
              final isChecked = selectedProperty.contains(title);
              return CustomCheckBox(isChecked: isChecked, onChange: (value) {
                  if (value == true) {
                    if (!selectedProperty.contains(title)) {
                      selectedProperty.add(title);
                    }
                  } else {
                    selectedProperty.remove(title);
                  }
                  onChange(selectedProperty.toList());
                });
            }),
            CustomTextPrimary(
              text: propertyItems[index],
              fontSize: 12.27.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        );
      },
    );
  }
}
