part of 'signup_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class UserRoleChanged extends SignUpEvent {
  const UserRoleChanged(this.userRole);

  final String userRole;
}

class EmailChanged extends SignUpEvent {
  EmailChanged(this.email);

  final String email;
}

class PasswordChanged extends SignUpEvent {
  const PasswordChanged(this.password);

  final String password;
}

class UsernameChanged extends SignUpEvent {
  const UsernameChanged(this.username);

  final String username;
}

class FullNameChanged extends SignUpEvent {
  const FullNameChanged(this.fullName);

  final String fullName;
}

class FormSubmitted extends SignUpEvent {}
