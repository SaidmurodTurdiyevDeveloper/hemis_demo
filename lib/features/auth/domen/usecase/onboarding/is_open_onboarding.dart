import 'package:hemis_demo/core/repository/local_repository.dart';
import 'package:hemis_demo/core/usecase/no_param.dart';
import 'package:hemis_demo/core/usecase/use_case_factory.dart';

import '../../../../../core/injection/injection.dart';

class IsOpenOnboarding extends UseCaseFactory<Future<bool>, NoParam> {
  final LocalRepository repository;

  IsOpenOnboarding({LocalRepository? repository}) : repository = repository ?? getIt.get<LocalRepository>();

  @override
  Future<bool> call(NoParam param) => repository.getIsOpenOnboarding();
}
