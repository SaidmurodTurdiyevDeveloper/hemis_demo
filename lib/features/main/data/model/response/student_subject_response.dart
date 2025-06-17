class StudentSubjectsResponse {
  bool? success;
  dynamic error;
  List<StudentSubjectsData>? data;
  int? code;

  StudentSubjectsResponse({this.success, this.error, this.data, this.code});

  StudentSubjectsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['data'] != null) {
      data = <StudentSubjectsData>[];
      json['data'].forEach((v) {
        data!.add(new StudentSubjectsData.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class StudentSubjectsData {
  StudentSubjectsSubject? subject;
  StudentSubjectsSubjectType? subjectType;
  String? sSemester;
  int? totalAcload;
  int? credit;

  StudentSubjectsData(
      {this.subject,
        this.subjectType,
        this.sSemester,
        this.totalAcload,
        this.credit});

  StudentSubjectsData.fromJson(Map<String, dynamic> json) {
    subject =
    json['subject'] != null ? new StudentSubjectsSubject.fromJson(json['subject']) : null;
    subjectType = json['subjectType'] != null
        ? new StudentSubjectsSubjectType.fromJson(json['subjectType'])
        : null;
    sSemester = json['_semester'];
    totalAcload = json['total_acload'];
    credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    if (this.subjectType != null) {
      data['subjectType'] = this.subjectType!.toJson();
    }
    data['_semester'] = this.sSemester;
    data['total_acload'] = this.totalAcload;
    data['credit'] = this.credit;
    return data;
  }
}

class StudentSubjectsSubject {
  int? id;
  String? name;
  String? code;

  StudentSubjectsSubject({this.id, this.name, this.code});

  StudentSubjectsSubject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class StudentSubjectsSubjectType {
  String? code;
  String? name;

  StudentSubjectsSubjectType({this.code, this.name});

  StudentSubjectsSubjectType.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}
