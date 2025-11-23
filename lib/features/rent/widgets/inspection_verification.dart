import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/core/utils/snackbar.dart';
import 'package:renter_pay/features/rent/controllers/rent_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/document_verification/custom_dotted_border.dart';
import 'package:renter_pay/shared/widgets/document_verification/document_upload.dart';
import 'package:renter_pay/shared/widgets/success_dialog.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class InspectionVerification extends StatelessWidget {
  const InspectionVerification({super.key});

  @override
  Widget build(BuildContext context) {
    RentDetailsController rentDetailsController = Get.find();
    return Container(
      padding: EdgeInsets.all(21.56.r),
      height: 666.h,
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.78.r),
        color: AppColors.whiteColor,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesPath.appLogo, height: 30.h, width: 174.37.w),
              SizedBox(height: 12.h),
              CustomTextSecondary(
                text:
                    'As this is your first time submitting an\ninspection request, please provide your ID/ Driving license/ Passport to continue.',
              ),
              SizedBox(height: 24.h),
              Obx(() {
                final frontImage = rentDetailsController.frontImage.value;
                return frontImage != null
                    ? CustomDottedBorder(
                        height: 201.h,
                        width: 312.w,
                        image: frontImage,
                      )
                    : DocumentUpload(titleText: 'Front Image', onTap: () {
                      UploadImage.pickDocument(
                          type: 'front',
                          frontImage: rentDetailsController.frontImage,
                          backImage: rentDetailsController.backImage,
                          picker: rentDetailsController.picker,
                        );
                    });
              }),
              SizedBox(height: 21.46.h),
              Obx(() {
                final backImage = rentDetailsController.backImage.value;
                return backImage != null
                    ? CustomDottedBorder(
                        height: 201.h,
                        width: 312.w,
                        image: backImage,
                      )
                    : DocumentUpload(
                        titleText: 'Back Side (Optional)',
                        onTap: () {
                          UploadImage.pickDocument(
                          type: 'back',
                          frontImage: rentDetailsController.frontImage,
                          backImage: rentDetailsController.backImage,
                          picker: rentDetailsController.picker,
                        );
                        },
                      );
              }),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomSecondaryButton(
                  text: 'Back',
                  height: 44.h,
                  width: 85.w,
                  onPressed: () {
                  Get.back();
                },),
                SizedBox(width: 15.w,),
                CustomPrimaryButton(height: 44.h,width: 85.w,
                text: 'Upload',
                 onPressed: () {
                  if (rentDetailsController.frontImage.value == null) {
                      errorSnack(message: 'Front Document Is Required');
                      showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessDialog(
                          onTap: () {
                            Get.toNamed(AppRoutes.inspectionFrom);
                          },
                        );
                      },
                    );
                    } else {
                      showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessDialog(
                          title1: 'Your inspection request has ',
                          title2: 'been submitted!',
                          subtitle: 'Our agent will contact you within 24 hours to confirm your appointment.',
                          button: Row(children: [
                            CustomPrimaryButton(height: 35.h, width: 122.w, text: 'Back To Property',fontSize: 12.sp,fontWeight: FontWeight.w400, onPressed: () {
                              Get.back();
                            },),
                            SizedBox(width: 9.w,),
                            CustomSecondaryButton(
                              height: 35.h,
                              width: 154.w,
                              text: 'Browse More Properties',
                              fontSize: 12.sp,fontWeight: FontWeight.w400,
                              onPressed: () {
                              Get.toNamed(AppRoutes.home);
                            },)
                          ],),
                        );
                      },
                    );
                    }
                },
                )
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
