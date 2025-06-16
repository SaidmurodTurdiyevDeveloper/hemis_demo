import 'package:hemis_demo/core/language/language.dart';
import 'package:hemis_demo/core/usecase/no_param.dart';

import '../../../../../core/injection/injection.dart';
import '../../../../../core/repository/local_repository.dart';
import '../../../../../core/usecase/use_case_factory.dart';

class GetLocalLanguage extends UseCaseFactory<Future<Language?>, NoParam> {
  final LocalRepository repository;

  GetLocalLanguage({LocalRepository? repository}) : repository = repository ?? getIt.get<LocalRepository>();

  @override
  Future<Language?> call(NoParam param) => repository.getLanguage();
}
