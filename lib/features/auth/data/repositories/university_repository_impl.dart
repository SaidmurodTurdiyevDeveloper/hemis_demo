import 'dart:convert';

import 'package:hemis_demo/core/repository/local_repository.dart';
import 'package:hemis_demo/core/storage/local_storage.dart';
import 'package:hemis_demo/core/utils/response_result.dart';
import 'package:hemis_demo/features/auth/data/model/response/university_response.dart';
import 'package:hemis_demo/features/auth/domen/entities/university_entity.dart';

import '../../../../core/client/api.dart';
import '../../../../core/client/api_client.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/language/language.dart';
import '../../domen/repository/university_repository.dart';
import '../model/mapper/university_mapper.dart';

class UniversityRepositoryImpl extends UniversityRepository {
  final ClientApi _clientApi;
  final LocalStorage localStorage;

  UniversityRepositoryImpl(ClientApi? clientApi, LocalStorage? localStorage)
      : _clientApi = clientApi ?? getIt.get<ClientApi>(),
        localStorage = localStorage ?? getIt.get<LocalStorage>();

  @override
  Future<ResponseResult<List<UniversityEntity>>> getUniversities() async {
    final response = await _clientApi.get(path: Api.mobileUniversity);
    if (response.success) {
      final universityResponse = UniversityResponse.fromJson(response.result);
      final mapper = UniversityMapper();
      final result = mapper.toEntityList(universityResponse.data ?? []);
      return ResponseResult(result: result, error: null);
    } else {
      return ResponseResult(result: null, error: Failure(message: "Network error", type: response.error ?? FailureType.server));
    }
  }

  @override
  Future<UniversityEntity?> getUniversity() async {
    try {
      final currentUniversity = await localStorage.getString("university");
      if (currentUniversity.isEmpty) {
        return null;
      }
      final universityMap = jsonDecode(currentUniversity) as Map<String, dynamic>;
      final university = UniversityResponseData.fromJson(universityMap);
      var mapper = UniversityMapper();
      var result = mapper.toEntity(university);
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> saveUniversity(UniversityEntity university) async {
    try {
      var universityMap = UniversityMapper().toResponse(university);
      var universityJson = jsonEncode(universityMap);
      return await localStorage.setString("university", universityJson);
    } catch (e) {
      return false;
    }
  }
}
