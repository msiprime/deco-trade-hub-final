// sign_up_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    on<UserRoleChanged>((event, emit) {
      emit(state.copyWith(userRole: event.userRole));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<FullNameChanged>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<FormSubmitted>((event, emit) {
      emit(state.copyWith(isSubmitting: true));
    });
  }
}
