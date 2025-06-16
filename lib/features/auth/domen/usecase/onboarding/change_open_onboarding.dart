import 'package:hemis_demo/core/repository/local_repository.dart';
import 'package:hemis_demo/core/usecase/use_case_factory.dart';

import '../../../../../core/injection/injection.dart';

class ChangeOpenOnboarding extends UseCaseFactory<Future, bool> {
  final LocalRepository repository;

  ChangeOpenOnboarding({LocalRepository? repository}) : repository = repository ?? getIt.get<LocalRepository>();

  @override
  Future call(bool param) async {
    await repository.saveIsOpenOnboarding(param);
  }
}
