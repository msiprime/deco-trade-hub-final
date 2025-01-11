import 'package:flutter_template_by_msi/features/profile/data/datasources/profile_datasource.dart';
import 'package:flutter_template_by_msi/features/profile/data/models/profile_model.dart';
import 'package:flutter_template_by_msi/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter_template_by_msi/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_template_by_msi/services/global/failures.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({
    required this.profileDataSource,
  });
  final ProfileDataSource profileDataSource;

  @override
  Future<Either<Failure, ProfileEntity>> getProfileData() async {
    try {
      final profileData = await profileDataSource.fetchProfile();

      return Right(profileData.toEntity());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfileData({
    required String? fullName,
    required String? userName,
    required String? email,
    required String? mobileNumber,
    required String? website,
    required String? avatarUrl,
  }) async {
    try {
      final profileData = await profileDataSource.updateProfile(
        fullName: fullName ?? '',
        userName: userName ?? '',
        email: email ?? '',
        mobileNumber: mobileNumber ?? '',
        website: website ?? '',
        avatarUrl: avatarUrl ?? '',
      );
      return Right(profileData.toEntity());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfileDataById({
    required String profileId,
  }) async {
    try {
      final profileData =
          await profileDataSource.fetchProfileById(profileId: profileId);

      return Right(profileData.toEntity());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
