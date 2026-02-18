import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/lease_agreement_controller.dart';
import 'package:renter_pay/features/dashboard/models/lease_agreement_model.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_contact.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_review.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/property/property_details_list.dart';
import 'package:renter_pay/shared/widgets/property/property_key_features.dart';

class ActivePropertyController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;
  RxBool isAccess = false.obs;

  final Rxn<LeaseAgreementItem> activeAgreement = Rxn<LeaseAgreementItem>();
  final Rxn<PropertyDetailsModel> activePropertyDetails =
      Rxn<PropertyDetailsModel>();
  final RxString leaseDurationText = ''.obs;
  final RxString landlordName = ''.obs;
  final RxString landlordPhone = ''.obs;
  final RxString landlordImageUrl = ''.obs;
  final RxString agentName = ''.obs;
  final RxString agentPhone = ''.obs;
  final RxString agentImageUrl = ''.obs;
  final RxString contactDescription = ''.obs;

  LeaseAgreementController? _leaseAgreementController;
  Worker? _leaseAgreementsWorker;

  List<String> title = [
    'Property Details',
    'Key Features & Amenities',
    'LandLord Details',
    'Agent Details',
    'Property Review',
  ];

  List<Widget> get widgetList {
    final details = activePropertyDetails.value ?? PropertyDetailsModel();
    final propertyID =
        activeAgreement.value?.propertyId ?? details.data?.id ?? 0;
    return [
      PropertyDetailsList(propertyDetails: details),
      PropertyKeyFeatures(propertyDetails: details),
      ActivePropertyContact(
        name: landlordName.value,
        phone: landlordPhone.value,
        description: contactDescription.value,
        leaseDurationValue: leaseDurationText.value,
        imageUrl: landlordImageUrl.value,
      ),
      ActivePropertyContact(
        name: agentName.value,
        phone: agentPhone.value,
        description: contactDescription.value,
        leaseDurationValue: leaseDurationText.value,
        imageUrl: agentImageUrl.value,
      ),
      ActivePropertyReview(propertyID: propertyID),
    ];
  }

  PropertyDetailsModel toPropertyDetailsModel(LeaseAgreementItem? item) {
    final property = item?.property;
    if (property == null) return PropertyDetailsModel();

    return PropertyDetailsModel(
      data: Data(
        id: property.id,
        landlordId: property.landlordId,
        propertyTypeId: property.propertyTypeId,
        title: property.title,
        name: property.name,
        description: property.description,
        address: property.address,
        city: property.city,
        state: property.state,
        postalCode: property.postalCode,
        country: property.country,
        latitude: property.latitude,
        longitude: property.longitude,
        bedrooms: property.bedrooms,
        bathrooms: property.bathrooms,
        parkingSpaces: property.parkingSpaces,
        buildingSize: property.buildingSize,
        yearBuilt: property.yearBuilt,
        status: property.status,
        isVerified: property.isVerified,
        isInPersonInspectionAvailable: property.isInPersonInspectionAvailable,
        isVirtualInspectionAvailable: property.isVirtualInspectionAvailable,
        isFavourite: property.isFavourite,
        features: property.features,
        rating: property.rating,
        ratingCount: property.ratingCount,
        images: property.images
            ?.map(
              (img) => Images(
                id: img.id,
                propertyId: img.propertyId,
                imagePath: img.imagePath,
                type: img.type,
                order: img.order,
                isPrimary: img.isPrimary,
                caption: img.caption,
                createdAt: img.createdAt,
                updatedAt: img.updatedAt,
              ),
            )
            .toList(),
        amenities: property.amenities
            ?.map(
              (a) => Amenities(
                id: a.id,
                propertyId: a.propertyId,
                amenityTypeId: a.amenityTypeId,
                amenityType: a.amenityType == null
                    ? null
                    : AmenityType(
                        id: a.amenityType?.id,
                        name: a.amenityType?.name,
                        slug: a.amenityType?.slug,
                        icon: a.amenityType?.icon,
                        description: a.amenityType?.description,
                      ),
                createdAt: a.createdAt,
                updatedAt: a.updatedAt,
              ),
            )
            .toList(),
        units: property.units
            ?.map(
              (unit) => Units(
                id: unit.id,
                propertyId: unit.propertyId,
                unitNumber: unit.unitNumber,
                unitName: unit.unitName,
                rentAmount: unit.rentAmount,
                rentType: unit.rentType == null
                    ? null
                    : RentType(
                        id: unit.rentType?.id,
                        name: unit.rentType?.name,
                        slug: unit.rentType?.slug,
                        rentDays: unit.rentType?.rentDays,
                      ),
                currencyObj: unit.currency == null
                    ? null
                    : Currency(
                        id: unit.currency?.id,
                        code: unit.currency?.code,
                        name: unit.currency?.name,
                        symbol: unit.currency?.symbol,
                        logo: unit.currency?.logo,
                        type: unit.currency?.type,
                      ),
                displayRentAmount: unit.displayRentAmount is num
                    ? (unit.displayRentAmount as num).toInt()
                    : null,
                displayCurrency: unit.displayCurrency == null
                    ? null
                    : Currency(
                        id: unit.displayCurrency?.id,
                        code: unit.displayCurrency?.code,
                        name: unit.displayCurrency?.name,
                        symbol: unit.displayCurrency?.symbol,
                        logo: unit.displayCurrency?.logo,
                        type: unit.displayCurrency?.type,
                      ),
                status: unit.status,
                bedrooms: unit.bedrooms is num
                    ? (unit.bedrooms as num).toInt()
                    : null,
                bathrooms: unit.bathrooms is num
                    ? (unit.bathrooms as num).toInt()
                    : null,
                size: unit.size,
                description: unit.description,
              ),
            )
            .toList(),
      ),
    );
  }

  void setActiveAgreement(LeaseAgreementItem? item) {
    activeAgreement.value = item;
    activePropertyDetails.value = toPropertyDetailsModel(item);
    landlordName.value = item?.landlord?.name ?? '';
    landlordPhone.value = item?.landlord?.phone ?? '';
    landlordImageUrl.value = item?.landlord?.image ?? '';
    agentName.value = item?.agreementDetails?.basicTerms?.agent?.fullName ?? '';
    agentPhone.value =
        item?.agreementDetails?.basicTerms?.agent?.phoneNumber ?? '';
    agentImageUrl.value = '';
    contactDescription.value = item?.terms ?? item?.property?.description ?? '';
    leaseDurationText.value = (item?.endDate).toDMMMyyyy().replaceAll(',', '');
  }

  void _syncFromLeaseAgreements(LeaseAgreementModel? model) {
    final list = model?.data?.data;
    final first = (list?.isNotEmpty ?? false) ? list!.first : null;
    setActiveAgreement(first);
  }

  @override
  void dispose() {
    _leaseAgreementsWorker?.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    if (Get.isRegistered<LeaseAgreementController>()) {
      _leaseAgreementController = Get.find<LeaseAgreementController>();
      _syncFromLeaseAgreements(
        _leaseAgreementController?.leaseAgreements.value,
      );
      _leaseAgreementsWorker = ever<LeaseAgreementModel?>(
        _leaseAgreementController!.leaseAgreements,
        _syncFromLeaseAgreements,
      );
    }
    super.onInit();
  }
}
