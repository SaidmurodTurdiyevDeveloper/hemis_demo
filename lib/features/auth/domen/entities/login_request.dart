
class LoginRequest{
  final String studentId;
  final String password;
  final bool rememberMe ;
  LoginRequest({required this.studentId, required this.password, required this.rememberMe});
}