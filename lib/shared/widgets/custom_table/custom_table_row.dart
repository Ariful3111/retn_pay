import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomTableRow extends StatelessWidget {
  final List<List<Widget>> row;
  final List<int> listIndex;
  final int rowIndex;
  final List<String> column;
  final Widget expandedTable;
  final VoidCallback onRowTap;
  final bool isExpandedTable;
  final bool isNeedLastCol;
  const CustomTableRow({
    super.key,
    required this.row,
    required this.listIndex,
    required this.rowIndex,
    required this.column,
    required this.expandedTable,
    required this.onRowTap,
    required this.isExpandedTable, required this.isNeedLastCol,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        GestureDetector(
          onTap: onRowTap,
          child: Row(
            children: List.generate(column.length, (colIndex) {
              bool isLastCol = colIndex == column.length - 1;
              return Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12.w),
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
                      left:isNeedLastCol? isLastCol
                          ? BorderSide(
                              width: 1.r,
                              color: isDark
                                  ? AppColors.darkBorderPrimary
                                  : AppColors.primaryBorder,
                            )
                          : BorderSide.none:BorderSide.none,
                    ),
                  ),
                  child: Center(child: row[rowIndex][colIndex]),
                ),
              );
            }),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: isExpandedTable ? expandedTable : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
