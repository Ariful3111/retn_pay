import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_row.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomTable extends StatelessWidget {
  final List<String> column;
  final List<List<Widget>> row;
  final List<int> listIndex;
  final Widget Function(int index) expandedTableBuilder;
  final Function(int) onRowTap;
  final bool Function(int index) isExpandedTableBuilder;
  final bool isNeedLastCol;
  const CustomTable({
    super.key,
    required this.column,
    required this.row,
    required this.listIndex,
    required this.onRowTap,
    required this.isExpandedTableBuilder,
    required this.expandedTableBuilder, required this.isNeedLastCol,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildColumn(context: context),
        ...buildRow(),
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

  List<Widget> buildRow() {
    return List.generate(row.length, (rowIndex) {
      return Obx(() {
        return CustomTableRow(
          row: row,
          listIndex: listIndex,
          rowIndex: rowIndex,
          column: column,
          expandedTable: expandedTableBuilder(rowIndex),
          onRowTap: () => onRowTap(rowIndex),
          isExpandedTable: isExpandedTableBuilder(rowIndex),
          isNeedLastCol: isNeedLastCol,
        );
      });
    });
  }
}
