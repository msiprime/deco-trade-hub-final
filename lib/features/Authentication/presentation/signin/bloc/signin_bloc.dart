import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_by_msi/features/Authentication/domain/repository/auth_repo.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        super(const SignInState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(status: SignInStatus.submitting));

      try {
        final response = await _authRepo.signIn(
          email: state.email,
          password: state.password,
        );

        response.fold(
          (failure) {
            emit(
              state.copyWith(
                status: SignInStatus.failure,
                errorMessage: failure.message,
              ),
            );
          },
          (user) {
            emit(state.copyWith(status: SignInStatus.success));
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: SignInStatus.failure,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }

  final AuthRepo _authRepo;
}
