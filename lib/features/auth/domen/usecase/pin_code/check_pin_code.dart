import '../../../../../core/injection/injection.dart';
import '../../../../../core/repository/local_repository.dart';
import '../../../../../core/usecase/use_case_factory.dart';

class CheckPinCode implements UseCaseFactory<Future<bool>, int> {
  final LocalRepository repository;

  CheckPinCode({LocalRepository? repository}) : repository = repository ?? getIt.get<LocalRepository>();

  @override
  Future<bool> call(int params) async {
    final code = await repository.getPinCode();
    return code == params;
  }
}
