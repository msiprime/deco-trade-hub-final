part of 'store_form_bloc.dart';

enum StoreFormStatus { initial, submitting, success, error }

class StoreFormState extends Equatable {
  final String storeName;
  final String ownerName;
  final String contactNumber;
  final String email;
  final String addressLine1;
  final String postalCode;
  final String storeType;
  final String? storeDescription;
  final String? storeLogoUrl;
  final String? addressLine2;
  final Map<String, dynamic>? socialMediaLinks;
  final String? websiteUrl;
  final String? storeBannerUrl;
  final bool isVerified;
  final String? featuredProductId;
  final StoreFormStatus status;

  const StoreFormState.StoreFormState({
    required this.storeName,
    required this.ownerName,
    required this.contactNumber,
    required this.email,
    required this.addressLine1,
    required this.postalCode,
    required this.storeType,
    required this.status,
    this.storeDescription,
    this.storeLogoUrl,
    this.addressLine2,
    this.socialMediaLinks,
    this.websiteUrl,
    this.storeBannerUrl,
    this.isVerified = false,
    this.featuredProductId,
  });

  StoreFormState.initial()
      : storeName = '',
        ownerName = '',
        contactNumber = '',
        email = '',
        addressLine1 = '',
        postalCode = '',
        storeType = 'Wholesaler',
        status = StoreFormStatus.initial,
        storeDescription = '',
        storeLogoUrl = '',
        addressLine2 = '',
        socialMediaLinks = {},
        websiteUrl = '',
        storeBannerUrl = '',
        isVerified = false,
        featuredProductId = '';

  StoreFormState copyWith({
    String? storeName,
    String? ownerName,
    String? contactNumber,
    String? email,
    String? addressLine1,
    String? postalCode,
    String? storeType,
    String? storeDescription,
    String? storeLogoUrl,
    String? addressLine2,
    Map<String, dynamic>? socialMediaLinks,
    String? websiteUrl,
    String? storeBannerUrl,
    bool? isVerified,
    String? featuredProductId,
    StoreFormStatus? status,
  }) {
    return StoreFormState.StoreFormState(
      status: status ?? this.status,
      storeName: storeName ?? this.storeName,
      ownerName: ownerName ?? this.ownerName,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      addressLine1: addressLine1 ?? this.addressLine1,
      postalCode: postalCode ?? this.postalCode,
      storeType: storeType ?? this.storeType,
      storeDescription: storeDescription ?? this.storeDescription,
      storeLogoUrl: storeLogoUrl ?? this.storeLogoUrl,
      addressLine2: addressLine2 ?? this.addressLine2,
      socialMediaLinks: socialMediaLinks ?? this.socialMediaLinks,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      storeBannerUrl: storeBannerUrl ?? this.storeBannerUrl,
      isVerified: isVerified ?? this.isVerified,
      featuredProductId: featuredProductId ?? this.featuredProductId,
    );
  }

  @override
  List<Object?> get props => [
        storeName,
        ownerName,
        contactNumber,
        email,
        addressLine1,
        postalCode,
        storeType,
        storeDescription,
        storeLogoUrl,
        addressLine2,
        socialMediaLinks,
        websiteUrl,
        storeBannerUrl,
        isVerified,
        featuredProductId,
      ];
}
