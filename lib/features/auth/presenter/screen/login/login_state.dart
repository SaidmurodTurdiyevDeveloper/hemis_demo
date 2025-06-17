part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String studentId;
  final String? studentIdError;
  final String password;
  final String? passwordError;
  final bool rememberMe;
  final bool obscurePassword;
  final bool submitting;
  final String? newScreen;
  final Failure? error;

  const LoginState({
    this.studentId = '',
    this.studentIdError,
    this.password = '',
    this.passwordError,
    this.newScreen,
    this.rememberMe = false,
    this.obscurePassword = true,
    this.submitting = false,
    this.error,
  });

  bool get isValid => studentIdError==null && passwordError==null;

  LoginState copyWith({
    String? studentId,
    String? studentIdError,
    String? password,
    String? passwordError,
    String? newScreen,
    bool? rememberMe,
    bool? obscurePassword,
    bool? submitting,
    Failure? error,
  }) => LoginState(
    studentId: studentId ?? this.studentId,
    studentIdError: studentIdError,
    password: password ?? this.password,
    passwordError: passwordError ,
    newScreen: newScreen ?? this.newScreen,
    rememberMe: rememberMe ?? this.rememberMe,
    obscurePassword: obscurePassword ?? this.obscurePassword,
    submitting: submitting ?? this.submitting,
    error: error,
  );

  @override
  List<Object?> get props => [studentId,studentIdError, password,passwordError ,obscurePassword,rememberMe, newScreen, submitting, error];
}
