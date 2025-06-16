import 'package:hemis_demo/core/utils/response_result.dart';
import 'package:hemis_demo/features/auth/domen/entities/university_entity.dart';

abstract class UniversityRepository {
  Future<bool> saveUniversity(UniversityEntity university);

  Future<ResponseResult<List<UniversityEntity>>> getUniversities();

  Future<UniversityEntity?> getUniversity();
}
