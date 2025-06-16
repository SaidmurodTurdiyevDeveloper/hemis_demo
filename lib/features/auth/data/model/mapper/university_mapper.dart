import 'package:hemis_demo/features/auth/data/model/response/university_response.dart';
import 'package:hemis_demo/features/auth/domen/entities/university_entity.dart';

class UniversityMapper {
  UniversityEntity toEntity(UniversityResponseData data) => UniversityEntity(
    code: data.code ?? "",
    name: data.name ?? "",
    apiUrl: data.apiUrl ?? "",
    studentUrl: data.studentUrl ?? "",
    employeeUrl: data.employeeUrl ?? "",
    universityType: data.universityType ?? "",
    versionType: data.versionType ?? ""
  );

  UniversityResponseData toResponse(UniversityEntity entity) => UniversityResponseData(
    code: entity.code,
    name: entity.name,
    apiUrl: entity.apiUrl,
    studentUrl: entity.studentUrl,
    employeeUrl: entity.employeeUrl,
    universityType: entity.universityType,
    versionType: entity.versionType
  );

  List<UniversityEntity> toEntityList(List<UniversityResponseData> data) => data.map((e) => toEntity(e)).toList();
}
