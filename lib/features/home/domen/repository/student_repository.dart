import 'package:hemis_demo/core/utils/response_result.dart';

import '../model/user_entity.dart';

abstract class StudentRepository {
  Future<ResponseResult<UserEntity>> getStudent();
}
