// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_name')
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_number')
  String get contactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line1')
  String get addressLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_type')
  String get storeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_description')
  String? get storeDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_logo_url')
  String? get storeLogoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line2')
  String? get addressLine2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_media_links')
  Map<String, dynamic>? get socialMediaLinks =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'website_url')
  String? get websiteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_banner_url')
  String? get storeBannerUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_product_id')
  String? get featuredProductId => throw _privateConstructorUsedError;

  /// Serializes this Store to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'store_name') String storeName,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'contact_number') String contactNumber,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'address_line1') String addressLine1,
      @JsonKey(name: 'postal_code') String postalCode,
      @JsonKey(name: 'store_type') String storeType,
      @JsonKey(name: 'store_description') String? storeDescription,
      @JsonKey(name: 'store_logo_url') String? storeLogoUrl,
      @JsonKey(name: 'address_line2') String? addressLine2,
      @JsonKey(name: 'social_media_links')
      Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') String? websiteUrl,
      @JsonKey(name: 'store_banner_url') String? storeBannerUrl,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'featured_product_id') String? featuredProductId});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storeName = null,
    Object? ownerId = null,
    Object? contactNumber = null,
    Object? email = null,
    Object? addressLine1 = null,
    Object? postalCode = null,
    Object? storeType = null,
    Object? storeDescription = freezed,
    Object? storeLogoUrl = freezed,
    Object? addressLine2 = freezed,
    Object? socialMediaLinks = freezed,
    Object? websiteUrl = freezed,
    Object? storeBannerUrl = freezed,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? featuredProductId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine1: null == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      storeDescription: freezed == storeDescription
          ? _value.storeDescription
          : storeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLogoUrl: freezed == storeLogoUrl
          ? _value.storeLogoUrl
          : storeLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMediaLinks: freezed == socialMediaLinks
          ? _value.socialMediaLinks
          : socialMediaLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storeBannerUrl: freezed == storeBannerUrl
          ? _value.storeBannerUrl
          : storeBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredProductId: freezed == featuredProductId
          ? _value.featuredProductId
          : featuredProductId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'store_name') String storeName,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'contact_number') String contactNumber,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'address_line1') String addressLine1,
      @JsonKey(name: 'postal_code') String postalCode,
      @JsonKey(name: 'store_type') String storeType,
      @JsonKey(name: 'store_description') String? storeDescription,
      @JsonKey(name: 'store_logo_url') String? storeLogoUrl,
      @JsonKey(name: 'address_line2') String? addressLine2,
      @JsonKey(name: 'social_media_links')
      Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') String? websiteUrl,
      @JsonKey(name: 'store_banner_url') String? storeBannerUrl,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'featured_product_id') String? featuredProductId});
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storeName = null,
    Object? ownerId = null,
    Object? contactNumber = null,
    Object? email = null,
    Object? addressLine1 = null,
    Object? postalCode = null,
    Object? storeType = null,
    Object? storeDescription = freezed,
    Object? storeLogoUrl = freezed,
    Object? addressLine2 = freezed,
    Object? socialMediaLinks = freezed,
    Object? websiteUrl = freezed,
    Object? storeBannerUrl = freezed,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? featuredProductId = freezed,
  }) {
    return _then(_$StoreImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine1: null == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      storeDescription: freezed == storeDescription
          ? _value.storeDescription
          : storeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLogoUrl: freezed == storeLogoUrl
          ? _value.storeLogoUrl
          : storeLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMediaLinks: freezed == socialMediaLinks
          ? _value._socialMediaLinks
          : socialMediaLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storeBannerUrl: freezed == storeBannerUrl
          ? _value.storeBannerUrl
          : storeBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredProductId: freezed == featuredProductId
          ? _value.featuredProductId
          : featuredProductId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl extends _Store {
  const _$StoreImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'store_name') required this.storeName,
      @JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'contact_number') required this.contactNumber,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'address_line1') required this.addressLine1,
      @JsonKey(name: 'postal_code') required this.postalCode,
      @JsonKey(name: 'store_type') required this.storeType,
      @JsonKey(name: 'store_description') this.storeDescription,
      @JsonKey(name: 'store_logo_url') this.storeLogoUrl,
      @JsonKey(name: 'address_line2') this.addressLine2,
      @JsonKey(name: 'social_media_links')
      final Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') this.websiteUrl,
      @JsonKey(name: 'store_banner_url') this.storeBannerUrl,
      @JsonKey(name: 'is_verified') this.isVerified = false,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'featured_product_id') this.featuredProductId})
      : _socialMediaLinks = socialMediaLinks,
        super._();

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'store_name')
  final String storeName;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'contact_number')
  final String contactNumber;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'address_line1')
  final String addressLine1;
  @override
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @override
  @JsonKey(name: 'store_type')
  final String storeType;
  @override
  @JsonKey(name: 'store_description')
  final String? storeDescription;
  @override
  @JsonKey(name: 'store_logo_url')
  final String? storeLogoUrl;
  @override
  @JsonKey(name: 'address_line2')
  final String? addressLine2;
  final Map<String, dynamic>? _socialMediaLinks;
  @override
  @JsonKey(name: 'social_media_links')
  Map<String, dynamic>? get socialMediaLinks {
    final value = _socialMediaLinks;
    if (value == null) return null;
    if (_socialMediaLinks is EqualUnmodifiableMapView) return _socialMediaLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'website_url')
  final String? websiteUrl;
  @override
  @JsonKey(name: 'store_banner_url')
  final String? storeBannerUrl;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'featured_product_id')
  final String? featuredProductId;

  @override
  String toString() {
    return 'Store(id: $id, storeName: $storeName, ownerId: $ownerId, contactNumber: $contactNumber, email: $email, addressLine1: $addressLine1, postalCode: $postalCode, storeType: $storeType, storeDescription: $storeDescription, storeLogoUrl: $storeLogoUrl, addressLine2: $addressLine2, socialMediaLinks: $socialMediaLinks, websiteUrl: $websiteUrl, storeBannerUrl: $storeBannerUrl, isVerified: $isVerified, createdAt: $createdAt, updatedAt: $updatedAt, featuredProductId: $featuredProductId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.storeDescription, storeDescription) ||
                other.storeDescription == storeDescription) &&
            (identical(other.storeLogoUrl, storeLogoUrl) ||
                other.storeLogoUrl == storeLogoUrl) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            const DeepCollectionEquality()
                .equals(other._socialMediaLinks, _socialMediaLinks) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.storeBannerUrl, storeBannerUrl) ||
                other.storeBannerUrl == storeBannerUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.featuredProductId, featuredProductId) ||
                other.featuredProductId == featuredProductId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      storeName,
      ownerId,
      contactNumber,
      email,
      addressLine1,
      postalCode,
      storeType,
      storeDescription,
      storeLogoUrl,
      addressLine2,
      const DeepCollectionEquality().hash(_socialMediaLinks),
      websiteUrl,
      storeBannerUrl,
      isVerified,
      createdAt,
      updatedAt,
      featuredProductId);

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImplToJson(
      this,
    );
  }
}

abstract class _Store extends Store {
  const factory _Store(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'store_name') required final String storeName,
      @JsonKey(name: 'owner_id') required final String ownerId,
      @JsonKey(name: 'contact_number') required final String contactNumber,
      @JsonKey(name: 'email') required final String email,
      @JsonKey(name: 'address_line1') required final String addressLine1,
      @JsonKey(name: 'postal_code') required final String postalCode,
      @JsonKey(name: 'store_type') required final String storeType,
      @JsonKey(name: 'store_description') final String? storeDescription,
      @JsonKey(name: 'store_logo_url') final String? storeLogoUrl,
      @JsonKey(name: 'address_line2') final String? addressLine2,
      @JsonKey(name: 'social_media_links')
      final Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') final String? websiteUrl,
      @JsonKey(name: 'store_banner_url') final String? storeBannerUrl,
      @JsonKey(name: 'is_verified') final bool isVerified,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'featured_product_id')
      final String? featuredProductId}) = _$StoreImpl;
  const _Store._() : super._();

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'store_name')
  String get storeName;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'contact_number')
  String get contactNumber;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'address_line1')
  String get addressLine1;
  @override
  @JsonKey(name: 'postal_code')
  String get postalCode;
  @override
  @JsonKey(name: 'store_type')
  String get storeType;
  @override
  @JsonKey(name: 'store_description')
  String? get storeDescription;
  @override
  @JsonKey(name: 'store_logo_url')
  String? get storeLogoUrl;
  @override
  @JsonKey(name: 'address_line2')
  String? get addressLine2;
  @override
  @JsonKey(name: 'social_media_links')
  Map<String, dynamic>? get socialMediaLinks;
  @override
  @JsonKey(name: 'website_url')
  String? get websiteUrl;
  @override
  @JsonKey(name: 'store_banner_url')
  String? get storeBannerUrl;
  @override
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'featured_product_id')
  String? get featuredProductId;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
