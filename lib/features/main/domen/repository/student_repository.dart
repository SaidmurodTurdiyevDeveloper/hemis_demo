import 'package:hemis_demo/core/utils/response_result.dart';
import '../../data/model/response/student_attandence_response.dart';
import '../../data/model/response/student_gp_score_response.dart';
import '../../data/model/response/student_lesson_schedule.dart';
import '../../data/model/response/student_subject_response.dart';
import '../../data/model/response/student_subject_tasks_response.dart';
import '../../data/model/response/student_subjects_with_result.dart';
import '../../data/model/response/student_tests_response.dart';
import '../../data/model/response/user_response.dart';

abstract class StudentRepository {
  Future<ResponseResult<UserResponseData>> getStudentMe();

  Future<ResponseResult<List<StudentSubjectsData>>> getStudentSubjects(String semester);

  Future<ResponseResult<List<StudentSubjectWithResultData>>> getStudentSubjectResults(String semester);

  Future<ResponseResult<List<StudentSubjectTasksData>>> getStudentSubjectTasks(String semester,int page, int limit);

  Future<ResponseResult<List<StudentTestsData>>> getStudentSubjectTest(String semester);

  Future<ResponseResult<List<StudentGpaScoreData>>> getStudentSubjectGpa();

  Future<ResponseResult<List<StudentScheduleData>>> getStudentSubjectSchedule(int week,int semester);

  Future<ResponseResult<List<StudentAttendenceResponseData>>> getStudentAttendance(String semester,String subject);
}
