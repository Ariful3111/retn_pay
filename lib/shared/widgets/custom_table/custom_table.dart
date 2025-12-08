import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomTable extends StatelessWidget {
  final List<String> column;
  final List<List<Widget>> row;
  final List<int> listIndex;
  const CustomTable({
    super.key,
    required this.column,
    required this.row,
    required this.listIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildColumn(context: context),
        ...buildRow(context: context),
      ],
    );
  }

  Widget buildColumn({required BuildContext context}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: List.generate(column.length, (index) {
        return Expanded(
          child: Container(
            height: 48.w,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkTableHead : AppColors.tableHead,
            ),
            child: Center(
              child: CustomTextSecondary(
                text: column[index],
                fontSize: 12,
                color: isDark
                    ? AppColors.whiteColor
                    : AppColors.darkBorderPrimary,
              ),
            ),
          ),
        );
      }),
    );
  }

  List<Widget> buildRow({required BuildContext context}) {
    return List.generate(row.length, (rowIndex) {
      bool isDark = Theme.of(context).brightness == Brightness.dark;
      final indexCount = listIndex[rowIndex];
      return Obx(() {
        final isExpanded =
            Get.find<InspectionRequestController>().expanded[indexCount];
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.find<InspectionRequestController>().toggleExpanded(
                  indexCount,
                );
              },
              child: Row(
                children: List.generate(column.length, (colIndex) {
                  bool isLastCol = colIndex == column.length - 1;
                  return Expanded(
                    child: Container(
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkSecondary
                            : AppColors.whiteColor,
                        border: Border(
                          bottom: BorderSide(
                            width: 1.r,
                            color: isDark
                                ? AppColors.darkBorderPrimary
                                : AppColors.primaryBorder,
                          ),
                          left: isLastCol
                              ? BorderSide(
                                  width: 1.r,
                                  color: isDark
                                      ? AppColors.darkBorderPrimary
                                      : AppColors.primaryBorder,
                                )
                              : BorderSide.none,
                        ),
                      ),
                      child: Center(child: row[rowIndex][colIndex]),
                    ),
                  );
                }),
              ),
            ),
            if (isExpanded) CustomTableExpanded(rowIndex: indexCount),
          ],
        );
      });
    });
  }
}
