import 'package:hemis_demo/core/language/language.dart';

import '../../../../../core/injection/injection.dart';
import '../../../../../core/repository/local_repository.dart';
import '../../../../../core/usecase/use_case_factory.dart';

class SaveLocalLanguage extends UseCaseFactory<Future, Language> {
  final LocalRepository repository;

  SaveLocalLanguage({LocalRepository? repository}) : repository = repository ?? getIt.get<LocalRepository>();

  @override
  Future call(Language param) async {
    await repository.saveLanguage(param);
  }
}
