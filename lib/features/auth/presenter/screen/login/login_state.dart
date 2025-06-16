part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String studentId;
  final String password;
  final bool rememberMe;
  final bool obscurePassword;
  final bool submitting;
  final String? newScreen;
  final Failure? error;

  const LoginState({
    this.studentId = '',
    this.password = '',
    this.newScreen,
    this.rememberMe = false,
    this.obscurePassword = true,
    this.submitting = false,
    this.error,
  });

  bool get isValid => studentId.isNotEmpty && password.isNotEmpty && password.length > 6;

  LoginState copyWith({
    String? studentId,
    String? password,
    String? newScreen,
    bool? rememberMe,
    bool? obscurePassword,
    bool? submitting,
    Failure? error,
  }) => LoginState(
    studentId: studentId ?? this.studentId,
    password: password ?? this.password,
    newScreen: newScreen ?? this.newScreen,
    rememberMe: rememberMe ?? this.rememberMe,
    obscurePassword: obscurePassword ?? this.obscurePassword,
    submitting: submitting ?? this.submitting,
    error: error,
  );

  @override
  List<Object?> get props => [studentId, password, rememberMe, newScreen, obscurePassword, submitting, error];
}
