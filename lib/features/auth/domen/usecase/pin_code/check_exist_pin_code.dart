import 'package:hemis_demo/core/injection/injection.dart';

import '../../../../../core/repository/local_repository.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../../../core/usecase/use_case_factory.dart';

class CheckExistPinCode implements UseCaseFactory<Future<bool>, NoParam> {
  final LocalRepository repository;

  CheckExistPinCode({LocalRepository? repository}) : repository = repository ?? getIt.get<LocalRepository>();

  @override
  Future<bool> call(NoParam params) async {
    final code = await repository.getPinCode();
    return (code > 0);
  }
}
