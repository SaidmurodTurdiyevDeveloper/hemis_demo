
class UniversityResponse {
  bool? success;
  dynamic error;
  List<UniversityResponseData>? data;
  int? code;

  UniversityResponse({this.success, this.error, this.data, this.code});

  UniversityResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['data'] != null) {
      data = <UniversityResponseData>[];
      json['data'].forEach((v) {
        data!.add(UniversityResponseData.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    return data;
  }
}

class UniversityResponseData {
  String? code;
  String? name;
  String? apiUrl;
  String? studentUrl;
  String? employeeUrl;
  String? universityType;
  String? versionType;

  UniversityResponseData(
      {this.code,
        this.name,
        this.apiUrl,
        this.studentUrl,
        this.employeeUrl,
        this.universityType,
        this.versionType});

  UniversityResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    apiUrl = json['api_url'];
    studentUrl = json['student_url'];
    employeeUrl = json['employee_url'];
    universityType = json['university_type'];
    versionType = json['version_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['api_url'] = apiUrl;
    data['student_url'] = studentUrl;
    data['employee_url'] = employeeUrl;
    data['university_type'] = universityType;
    data['version_type'] = versionType;
    return data;
  }
}
