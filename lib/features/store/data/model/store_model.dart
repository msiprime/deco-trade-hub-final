import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class Store with _$Store {
  const Store._();

  const factory Store({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'store_name') required String storeName,
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'contact_number') required String contactNumber,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'address_line1') required String addressLine1,
    @JsonKey(name: 'postal_code') required String postalCode,
    @JsonKey(name: 'store_type') required String storeType,
    @JsonKey(name: 'store_description') String? storeDescription,
    @JsonKey(name: 'store_logo_url') String? storeLogoUrl,
    @JsonKey(name: 'address_line2') String? addressLine2,
    @JsonKey(name: 'social_media_links') Map<String, dynamic>? socialMediaLinks,
    @JsonKey(name: 'website_url') String? websiteUrl,
    @JsonKey(name: 'store_banner_url') String? storeBannerUrl,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'featured_product_id') String? featuredProductId,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
