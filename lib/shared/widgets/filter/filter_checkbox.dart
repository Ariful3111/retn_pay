import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class FilterCheckbox extends StatelessWidget {
    final List propertyItems;
  final RxList<String> selectedProperty;
  final Function(List<String>) onChange;
  const FilterCheckbox({super.key, required this.propertyItems, required this.selectedProperty, required this.onChange});

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
            Obx((){
              final isChecked = selectedProperty.contains(title);
              return Checkbox(
                visualDensity: VisualDensity.compact,
                activeColor: AppColors.primaryColorDark,
               side: BorderSide(color:  Color(0xFF697483)),
               
              value: isChecked,
              onChanged: (value) {
                if (value == true) {
                  if(!selectedProperty.contains(title)){
                    selectedProperty.add(title);
                  }
                } else {
                  selectedProperty.remove(title);
                }
                onChange(selectedProperty.toList());
              },
            );
            }),
            CustomText.primaryText(
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