import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter_template_by_msi/features/profile/domain/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(ProfileInitial()) {
    on<GetProfileDataEvent>(_onGetProfileData);
    on<UpdateProfileDataEvent>(_onUpdateProfileData);
  }

  final ProfileRepository _profileRepository;

  Future<FutureOr<void>> _onGetProfileData(
    GetProfileDataEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileLoading());
      final response = await _profileRepository.getProfileData();

      response.fold(
        (failure) {
          emit(ProfileError(failure.message));
        },
        (profile) => emit(ProfileSuccess(profileEntity: profile)),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<FutureOr<void>> _onUpdateProfileData(
    UpdateProfileDataEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileLoading());

      final response = await _profileRepository.updateProfileData(
        fullName: event.fullName,
        userName: event.userName,
        email: event.email,
        mobileNumber: event.mobileNumber,
        website: event.website,
        avatarUrl: event.avatarUrl,
      );

      response.fold(
        (failure) {
          emit(ProfileError(failure.message));
        },
        (profile) => emit(ProfileSuccess(profileEntity: profile)),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
