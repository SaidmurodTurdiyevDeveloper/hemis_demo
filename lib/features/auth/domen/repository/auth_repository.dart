import '../../../../core/utils/response_result.dart';

abstract class AuthRepository {
  Future<ResponseResult<String>> login({required int login, required String password});

  Future<ResponseResult<bool>> refreshToken();
}
