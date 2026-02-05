import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/colors.dart';

class UploadImage {
  static Future<void> pickDocument({
    required String type,
    required Rxn<XFile> frontImage,
    required Rxn<XFile> backImage,
    required ImagePicker picker,
  }) async {
    try {
      await Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  Get.back();
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 25,
                  );
                  if (image != null) {
                    if (type == 'front') {
                      frontImage.value = image;
                    } else if (type == 'back') {
                      backImage.value = image;
                    }
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Get.back();
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 25,
                  );
                  if (image != null) {
                    if (type == 'front') {
                      frontImage.value = image;
                    } else if (type == 'back') {
                      backImage.value = image;
                    }
                  }
                },
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print('$e');
    }
  }

  static Future<void> sendImage({
    required ImagePicker picker,
    required Rxn<XFile> pickImage,
    required BuildContext context,
  }) async {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    await Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                Get.back();
                final XFile? image = await picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 25,
                );
                if (image != null) {
                  pickImage.value = image;
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                Get.back();
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 25,
                );
                if (image != null) {
                  pickImage.value = image;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> pickMultipleImage({
    required List<XFile> allImages,
  }) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(imageQuality: 25);
    if (images.isNotEmpty) {
      final newImages = images.map((e) => e).toList();
      allImages.insertAll(0, newImages);
    }
  }
}
