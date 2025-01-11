part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileError extends ProfileState {
  const ProfileError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class ProfileSuccess extends ProfileState {
  const ProfileSuccess({
    required this.profileEntity,
  });

  final ProfileEntity profileEntity;

  @override
  List<Object> get props => [profileEntity];
}
