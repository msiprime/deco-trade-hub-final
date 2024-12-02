import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/features/user/domain/entities/user.dart';
import 'package:flutter_template_by_msi/features/user/domain/use_cases/user_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

part 'user_event.dart';
part 'user_state.dart';

@Injectable()
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.getUsers) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  final GetUsers getUsers;

  FutureOr<void> _onFetchUsers(
    FetchUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    // await Future<void>.delayed(20.seconds);
    try {
      final users = await getUsers();
      users.fold(
        (l) => emit(UserError(l)),
        (r) => emit(UserLoaded(r)),
      );
    } catch (e) {
      // Here, instead of directly using $e, create a custom message.
      String errorMessage;
      if (e is ConnectionError) {
        emit(UserError('No internet connection.'));

        errorMessage =
            e.toString(); // Call your custom toString() implementation
      } else {
        errorMessage =
            'An unexpected error occurred.'; // Fallback for other exceptions
      }
      emit(UserError(errorMessage));
    }
  }
}
