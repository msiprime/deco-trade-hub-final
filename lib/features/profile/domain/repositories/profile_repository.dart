import 'package:deco_trade_hub/features/profile/domain/entities/profile_entity.dart';
import 'package:deco_trade_hub/services/global/failures.dart';
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
