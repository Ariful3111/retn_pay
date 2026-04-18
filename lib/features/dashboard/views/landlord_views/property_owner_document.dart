import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_document_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_submit_document.dart.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_image.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document_upload.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class PropertyOwnerDocument
    extends GetView<PropertyManagementDocumentController> {
  const PropertyOwnerDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: SingleChildScrollView(
        child: AddNewPropertyContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PropertyManagementAppbar(),
              SizedBox(height: 24.h),
              CustomTextPrimary(
                text: 'Property Ownership Documents',
                fontSize: 22.sp,
              ),
              SizedBox(height: 20.h),

              // Dropdown to select document type
              _DocumentTypeDropdown(controller: controller),

              SizedBox(height: 16.h),

              // Show selected document types with their upload sections
              Obx(() {
                if (controller.selectedDocumentTypes.isEmpty) {
                  return SizedBox.shrink();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.selectedDocumentTypes.map((key) {
                    final label = controller.getDocumentLabel(key);
                    final imageList = controller.getImageList(key);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextPrimary(
                                text: label,
                                fontSize: 20.sp,
                                color: AppColors.primaryColorDark,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.removeDocumentType(key);
                              },
                              child: Icon(
                                Icons.close,
                                size: 20.sp,
                                color: AppColors.primaryColorDark,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Obx(
                          () => controller.isLoading.value
                              ? ButtonLoading()
                              : PropertyOwnerDocumentUpload(
                                  key: ValueKey(imageList.length),
                                  onTap: () async {
                                    await controller.submitDocument(
                                      documentType: key,
                                      images: imageList,
                                    );
                                  },
                                  child: PropertyOwnerDocumentImage(
                                    onPickImage: () async {
                                      await UploadImage.pickMultipleImage(
                                        allImages: imageList,
                                      );
                                    },
                                    image: imageList,
                                  ),
                                ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              }),

              SizedBox(height: 24.h),
              PropertyOwnerSubmitDocument(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Multi-select dropdown widget for document types
class _DocumentTypeDropdown extends StatefulWidget {
  final PropertyManagementDocumentController controller;
  const _DocumentTypeDropdown({required this.controller});

  @override
  State<_DocumentTypeDropdown> createState() => _DocumentTypeDropdownState();
}

class _DocumentTypeDropdownState extends State<_DocumentTypeDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _toggleDropdown() {
    if (_overlayEntry != null) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final bool isDarkOverlay = Theme.of(context).brightness == Brightness.dark;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _removeOverlay,
            behavior: HitTestBehavior.translucent,
            child: SizedBox.expand(),
          ),
          CompositedTransformFollower(
            link: _layerLink,
            offset: Offset(0, size.height + 4.h),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: size.width,
                constraints: BoxConstraints(maxHeight: 250.h),
                decoration: BoxDecoration(
                  color: isDarkOverlay
                      ? AppColors.darkPrimary
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: isDarkOverlay
                        ? AppColors.darkBorderPrimary
                        : AppColors.whiteLightBorder,
                    width: 0.91.r,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.controller.documentTypes.map((docType) {
                        final key = docType['key']!;
                        final label = docType['label']!;
                        final isSelected = widget.controller
                            .isDocumentTypeSelected(key);
                        bool isDark =
                            Theme.of(context).brightness == Brightness.dark;
                        return InkWell(
                          onTap: () {
                            widget.controller.toggleDocumentType(key);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primaryColorDark.withValues(
                                      alpha: 0.1,
                                    )
                                  : Colors.transparent,
                              border: Border(
                                bottom: BorderSide(
                                  color: isDark
                                      ? AppColors.darkBorderPrimary
                                      : AppColors.whiteLightBorder,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  size: 20.sp,
                                  color: isSelected
                                      ? AppColors.primaryColorDark
                                      : isDark
                                      ? AppColors.darkSecondaryText
                                      : AppColors.secondaryTextColor,
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: CustomTextSecondary(
                                    text: label,
                                    fontSize: 14.sp,
                                    color: isSelected
                                        ? AppColors.primaryColorDark
                                        : isDark
                                        ? AppColors.darkSecondaryText
                                        : AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
    setState(() {});
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(9.4.r),
            border: Border.all(
              width: 0.78.r,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.primaryBorder,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomTextPrimary(
                  text: 'Select Document Type',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.secondaryTextColor,
                ),
              ),
              Image.asset(
                _overlayEntry != null ? IconsPath.upArrow : IconsPath.downArrow,
                height: 20.h,
                width: 15.w,
                color: const Color(0xFF868C98),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
