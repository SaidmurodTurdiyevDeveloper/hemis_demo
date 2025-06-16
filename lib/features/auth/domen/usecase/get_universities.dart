import 'package:hemis_demo/core/utils/response_result.dart';
import 'package:hemis_demo/features/auth/domen/repository/university_repository.dart';

import '../../../../core/injection/injection.dart';
import '../../../../core/usecase/no_param.dart';
import '../../../../core/usecase/use_case_factory.dart';
import '../entities/university_entity.dart';

class GetUniversities extends UseCaseFactory<Future<ResponseResult<List<UniversityEntity>>>, NoParam> {
  final UniversityRepository repository;

  GetUniversities({UniversityRepository? repository}) : repository = repository ?? getIt.get<UniversityRepository>();

  @override
  Future<ResponseResult<List<UniversityEntity>>> call(NoParam param) => repository.getUniversities();
}
