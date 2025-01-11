import 'package:flutter_template_by_msi/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter_template_by_msi/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfileData();

  Future<Either<Failure, ProfileEntity>> getProfileDataById({
    required String profileId,
  });

  Future<Either<Failure, ProfileEntity>> updateProfileData({
    required String? fullName,
    required String? userName,
    required String? email,
    required String? mobileNumber,
    required String? website,
    required String? avatarUrl,
  });
}
