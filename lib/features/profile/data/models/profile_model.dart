import 'package:flutter_template_by_msi/features/profile/domain/entities/profile_entity.dart';

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    required this.mobileNumber,
    this.avatarUrl,
    this.website,
    this.isVerified,
    this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      email: json['email'] as String,
      userName: json['username'] as String,
      fullName: json['full_name'] as String,
      mobileNumber: json['phone_number'] as String,
      avatarUrl: json['avatar_url'] as String?,
      website: json['website'] as String?,
      updatedAt: json['updated_at'] as DateTime?,
      isVerified: json['verified'] as bool?,
    );
  }

  final String id;
  final String email;
  final String userName;
  final String mobileNumber;
  final String fullName;
  final String? avatarUrl;
  final String? website;
  final bool? isVerified;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': userName,
      'full_name': fullName,
      'phone_number': mobileNumber,
      'avatar_url': avatarUrl,
      'website': website,
      'updated_at': updatedAt,
      'verified': isVerified,
    };
  }
}

extension ProfileModelMapper on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      email: email,
      userName: userName,
      fullName: fullName,
      mobileNumber: mobileNumber,
      avatarUrl: avatarUrl,
      website: website,
      updatedAt: updatedAt,
      isVerified: isVerified ?? false,
    );
  }
}

extension ProfileEntityMapper on ProfileEntity {
  ProfileModel toModel() {
    return ProfileModel(
      id: id,
      email: email,
      userName: userName,
      fullName: fullName,
      mobileNumber: mobileNumber,
      avatarUrl: avatarUrl,
      website: website,
      updatedAt: updatedAt,
      isVerified: isVerified,
    );
  }
}
