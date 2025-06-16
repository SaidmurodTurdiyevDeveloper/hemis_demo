import 'package:hemis_demo/core/utils/response_result.dart';
import 'package:hemis_demo/features/home/domen/model/user_entity.dart';

import '../../domen/repository/student_repository.dart';

class StudentRepositoryImpl extends StudentRepository {
  @override
  Future<ResponseResult<UserEntity>> getStudent() async {
    return ResponseResult();
  }
}
