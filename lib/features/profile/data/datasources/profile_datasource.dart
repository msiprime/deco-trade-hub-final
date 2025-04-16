import 'package:deco_trade_hub/features/profile/data/models/profile_model.dart';

abstract interface class ProfileDataSource {
  Future<ProfileModel> fetchProfile();

  Future<ProfileModel> fetchProfileById({
    required String profileId,
  });

  Future<ProfileModel> updateProfile({
    required String fullName,
    required String userName,
    required String email,
    required String mobileNumber,
    required String website,
    required String avatarUrl,
  });
}
