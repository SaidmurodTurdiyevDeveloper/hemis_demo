import 'package:hemis_demo/core/utils/response_result.dart';
import 'package:hemis_demo/features/home/data/model/response/student_attandence_response.dart';
import 'package:hemis_demo/features/home/data/model/response/student_gp_score_response.dart';
import 'package:hemis_demo/features/home/data/model/response/student_lesson_schedule.dart';
import 'package:hemis_demo/features/home/data/model/response/student_subject_response.dart';
import 'package:hemis_demo/features/home/data/model/response/student_subject_tasks_response.dart';
import 'package:hemis_demo/features/home/data/model/response/student_subjects_with_result.dart';
import 'package:hemis_demo/features/home/data/model/response/student_tests_response.dart';
import 'package:hemis_demo/features/home/data/model/response/user_response.dart';
import 'package:hemis_demo/features/home/domen/model/user_entity.dart';

import '../../../../core/client/api.dart';
import '../../../../core/client/api_client.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/storage/local_storage.dart';
import '../../domen/repository/student_repository.dart';

class StudentRepositoryImpl extends StudentRepository {
  final ClientApi _clientApi;
  final LocalStorage localStorage;
  StudentRepositoryImpl(ClientApi? clientApi, LocalStorage? localStorage)
      : _clientApi = clientApi ?? getIt.get<ClientApi>(),
        localStorage = localStorage ?? getIt.get<LocalStorage>();


  /// This class all need to write mapper but i did not have enough time

  /// I write mapper class later
  @override
  Future<ResponseResult<List<StudentAttendenceResponseData>>> getStudentAttendance(String semester,String subject) async {
    final response = await _clientApi.get(path: Api.studentAttendance(semester, subject));
    if (response.success) {
      final universityResponse = StudentAttendenceResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
  /// I write mapper class later
  @override
  Future<ResponseResult<UserResponseData>> getStudentMe() async {
    final response = await _clientApi.get(path: Api.student);
    if (response.success) {
      final universityResponse = UserResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
  /// I write mapper class later
  @override
  Future<ResponseResult<List<StudentGpaScoreData>>> getStudentSubjectGpa() async {
    final response = await _clientApi.get(path: Api.studentGpaScore);
    if (response.success) {
      final universityResponse = StudentGpaScoreResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
  /// I write mapper class later
  @override
  Future<ResponseResult<List<StudentSubjectWithResultData>>> getStudentSubjectResults(String semester) async {
    final response = await _clientApi.get(path: Api.studentSubjectResult(semester));
    if (response.success) {
      final universityResponse = StudentSubjectWithResultResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
  /// I write mapper class later
  @override
  Future<ResponseResult<List<StudentScheduleData>>> getStudentSubjectSchedule(int week,int semester) async {
    final response = await _clientApi.get(path: Api.studentSchedule(week, semester));
    if (response.success) {
      final universityResponse = StudentScheduleResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
  /// I write mapper class later
  @override
  Future<ResponseResult<List<StudentSubjectTasksData>>> getStudentSubjectTasks(String semester,int page, int limit) async {
    final response = await _clientApi.get(path: Api.studentSubjectTasks(semester, page, limit));
    if (response.success) {
      final universityResponse = StudentSubjectTasksResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
  /// I write mapper class later
  @override
  Future<ResponseResult<List<StudentTestsData>>> getStudentSubjectTest(String semester) async {
    final response = await _clientApi.get(path: Api.studentSubjectTest(semester));
    if (response.success) {
      final universityResponse = StudentTestsResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
  /// I write mapper class later
  @override
  Future<ResponseResult<List<StudentSubjectsData>>> getStudentSubjects(String semester) async {
    final response = await _clientApi.get(path: Api.studentSubject(semester));
    if (response.success) {
      final universityResponse = StudentSubjectsResponse.fromJson(response.result);
      return ResponseResult(result: universityResponse.data, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }
}
