import 'package:hemis_demo/core/client/api.dart';
import 'package:hemis_demo/core/errors/failure.dart';
import 'package:hemis_demo/core/injection/injection.dart';
import 'package:hemis_demo/core/utils/response_result.dart';
import 'package:hemis_demo/features/auth/data/model/response/login_response.dart';

import '../../../../core/client/api_client.dart';
import '../../domen/repository/auth_repository.dart';
import '../model/request_body/login_request_body.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ClientApi _clientApi = getIt.get();

  @override
  Future<ResponseResult<String>> login({required int login, required String password}) async {
    var body = LoginRequestBody(login: login, password: password);
    var response = await _clientApi.post(path: Api.login, body: body.toJson());
    if (response.success) {
      var result = LoginResponseData.fromJson(response.result);
      return ResponseResult(result: result.token, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Id yoki parol xato kiritildi", type: response.error ?? FailureType.server));
    }
  }

  @override
  Future<ResponseResult<String>> refreshToken() async {
    return ResponseResult(result: null, error: null);
  }
}
