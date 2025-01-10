part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    required this.email,
    required this.fullName,
    required this.password,
    required this.username,
    required this.userRole,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      email: '',
      password: '',
      username: '',
      fullName: '',
      userRole: 'Retailer',
    );
  }

  final String email;
  final String password;
  final String username;
  final String fullName;
  final String userRole;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  SignUpState copyWith({
    String? email,
    String? password,
    String? username,
    String? fullName,
    String? userRole,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      userRole: userRole ?? this.userRole,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        username,
        fullName,
        isSubmitting,
        isSuccess,
        isFailure,
        userRole,
      ];
}
