part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  UserLoaded(this.users);

  final List<User> users;
}

final class UserError extends UserState {
  UserError(this.message);

  final String message;
}
