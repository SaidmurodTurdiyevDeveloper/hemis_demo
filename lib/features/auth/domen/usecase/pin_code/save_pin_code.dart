import '../../../../../core/injection/injection.dart';
import '../../../../../core/repository/local_repository.dart';
import '../../../../../core/usecase/use_case_factory.dart';

class SavePinCode implements UseCaseFactory<Future<bool>, int> {
  final LocalRepository repository;

  SavePinCode({LocalRepository? repository}) : repository = repository ?? getIt.get<LocalRepository>();

  @override
  Future<bool> call(int params) => repository.saveToken(params.toString());
}
