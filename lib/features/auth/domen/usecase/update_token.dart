import '../../../../core/injection/injection.dart';
import '../../../../core/usecase/no_param.dart';
import '../../../../core/usecase/use_case_factory.dart';
import '../../../../core/utils/response_result.dart';
import '../repository/auth_repository.dart';

class UpdateToken implements UseCaseFactory<Future<ResponseResult<bool>>, NoParam> {
  final AuthRepository authRepository;

  UpdateToken({AuthRepository? authRepository}) : authRepository = authRepository ?? getIt.get<AuthRepository>();

  @override
  Future<ResponseResult<bool>> call(NoParam params) => authRepository.refreshToken();
}
