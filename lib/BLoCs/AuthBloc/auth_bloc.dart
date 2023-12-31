import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Repositories/AuthRepo/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(LoginInitialState());
      try {
        await authRepository.loginUser(username: event.username, password: event.password)
            .then(
          (value) {
            if (value.status == true && value.message == "Authenticated User!") {
              emit(LoginSuccessState(value.data.id.toString(), value.data.tokEn, value.data.userType));
            } else {
              emit(LoginErrorState(value.message));
            }
          },
        );
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
