import 'package:hemis_demo/core/repository/local_repository.dart';
import 'package:hemis_demo/core/usecase/use_case_factory.dart';
import 'package:hemis_demo/core/utils/response_result.dart';
import 'package:hemis_demo/features/auth/domen/entities/login_request.dart';
import 'package:hemis_demo/features/auth/domen/repository/auth_repository.dart';

import '../../../../core/injection/injection.dart';

class LoginUseCase extends UseCaseFactory<Future<ResponseResult<String>>, LoginRequest> {
  final AuthRepository repository;
  final LocalRepository localRepository;

  LoginUseCase({AuthRepository? repository, LocalRepository? localRepository})
    : repository = repository ?? getIt.get<AuthRepository>(),
      localRepository = localRepository ?? getIt.get<LocalRepository>();

  @override
  Future<ResponseResult<String>> call(LoginRequest param) async {
    final result = await repository.login(login: int.parse(param.studentId), password: param.password);
    if (result.result != null) {
      await localRepository.saveRememberMe(param.rememberMe);
      if (param.rememberMe) {
        await localRepository.saveId(param.studentId);
        await localRepository.savePassword(param.password);
      }
      await localRepository.saveToken(result.result!);
    }
    return result;
  }
}
