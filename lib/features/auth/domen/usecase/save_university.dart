import 'package:hemis_demo/features/auth/domen/repository/university_repository.dart';

import '../../../../core/injection/injection.dart';
import '../../../../core/usecase/use_case_factory.dart';
import '../entities/university_entity.dart';

class SaveUniversity extends UseCaseFactory<Future<bool>, UniversityEntity> {
  final UniversityRepository repository;

  SaveUniversity({UniversityRepository? repository}) : repository = repository ?? getIt.get<UniversityRepository>();

  @override
  Future<bool> call(UniversityEntity param) => repository.saveUniversity(param);
}
