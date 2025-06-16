class StudentGpaScoreResponse {
  bool? success;
  dynamic error;
  List<StudentGpaScoreData>? data;
  int? code;

  StudentGpaScoreResponse({this.success, this.error, this.data, this.code});

  StudentGpaScoreResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['data'] != null) {
      data = <StudentGpaScoreData>[];
      json['data'].forEach((v) {
        data!.add(new StudentGpaScoreData.fromJson(v));
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

class StudentGpaScoreData {
  int? id;
  int? iStudent;
  int? iGroup;
  StudentGpaScoreEducationYear? educationYear;
  StudentGpaScoreLevel? level;
  String? gpa;
  String? creditSum;
  int? subjects;
  int? debtSubjects;
  bool? canTransfer;
  String? method;
  int? createdAt;

  StudentGpaScoreData(
      {this.id,
        this.iStudent,
        this.iGroup,
        this.educationYear,
        this.level,
        this.gpa,
        this.creditSum,
        this.subjects,
        this.debtSubjects,
        this.canTransfer,
        this.method,
        this.createdAt});

  StudentGpaScoreData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iStudent = json['_student'];
    iGroup = json['_group'];
    educationYear = json['educationYear'] != null
        ? new StudentGpaScoreEducationYear.fromJson(json['educationYear'])
        : null;
    level = json['level'] != null ? new StudentGpaScoreLevel.fromJson(json['level']) : null;
    gpa = json['gpa'];
    creditSum = json['credit_sum'];
    subjects = json['subjects'];
    debtSubjects = json['debt_subjects'];
    canTransfer = json['can_transfer'];
    method = json['method'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_student'] = this.iStudent;
    data['_group'] = this.iGroup;
    if (this.educationYear != null) {
      data['educationYear'] = this.educationYear!.toJson();
    }
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    data['gpa'] = this.gpa;
    data['credit_sum'] = this.creditSum;
    data['subjects'] = this.subjects;
    data['debt_subjects'] = this.debtSubjects;
    data['can_transfer'] = this.canTransfer;
    data['method'] = this.method;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class StudentGpaScoreEducationYear {
  String? code;
  String? name;
  bool? current;

  StudentGpaScoreEducationYear({this.code, this.name, this.current});

  StudentGpaScoreEducationYear.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['current'] = this.current;
    return data;
  }
}

class StudentGpaScoreLevel {
  String? code;
  String? name;

  StudentGpaScoreLevel({this.code, this.name});

  StudentGpaScoreLevel.fromJson(Map<String, dynamic> json) {
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
