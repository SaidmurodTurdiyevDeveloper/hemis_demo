import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hemis_demo/core/errors/failure.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/features/auth/domen/entities/login_request.dart';

import '../../../../../core/injection/injection.dart';
import '../../../domen/usecase/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final _useCase = getIt<LoginUseCase>();

  void studentIdChanged(String v) => emit(state.copyWith(studentId: v, error: null, studentIdError: null));

  void studentIdChangedError(String? v) => emit(state.copyWith(studentIdError: v));

  void passwordChanged(String v) => emit(state.copyWith(password: v, error: null, passwordError: null));

  void toggleObscure() => emit(state.copyWith(obscurePassword: !state.obscurePassword));

  void passwordChangedError(String? v) => emit(state.copyWith(passwordError: v));

  void toggleRememberMe() => emit(state.copyWith(rememberMe: !state.rememberMe));

  Future<void> submit() async {
    if (state.submitting) return;
    emit(state.copyWith(submitting: true));
    final result = await _useCase.call(LoginRequest(studentId: state.studentId, password: state.password, rememberMe: state.rememberMe));
    if (result.error != null) {
      emit(state.copyWith(error: result.error, submitting: false));
    } else {
      if (state.rememberMe) {
        emit(state.copyWith(submitting: false, newScreen: Screens.lock));
      } else {
        emit(state.copyWith(submitting: false, newScreen: Screens.home));
      }
    }
  }
}
