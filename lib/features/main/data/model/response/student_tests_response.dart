
class StudentTestsResponse {
  bool? success;
  dynamic error;
  int? code;
  List<StudentTestsData>? data;

  StudentTestsResponse({this.success, this.error, this.code, this.data});

  StudentTestsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    code = json['code'];
    if (json['data'] != null) {
      data = <StudentTestsData>[];
      json['data'].forEach((v) {
        data!.add(new StudentTestsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentTestsData {
  int? id;
  StudentTestsSubject? subject;
  StudentTestsExamType? examType;
  StudentTestsExamType? finalExamType;
  StudentTestsSemester? semester;
  StudentTestsGroup? group;
  StudentTestsEmployee? employee;
  StudentTestsAuditorium? auditorium;
  StudentTestsLessonPair? lessonPair;
  int? examDate;
  StudentTestsFaculty? faculty;
  StudentTestsFaculty? department;
  StudentTestsEducationYear? educationYear;

  StudentTestsData(
      {this.id,
        this.subject,
        this.examType,
        this.finalExamType,
        this.semester,
        this.group,
        this.employee,
        this.auditorium,
        this.lessonPair,
        this.examDate,
        this.faculty,
        this.department,
        this.educationYear});

  StudentTestsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject =
    json['subject'] != null ? new StudentTestsSubject.fromJson(json['subject']) : null;
    examType = json['examType'] != null
        ? new StudentTestsExamType.fromJson(json['examType'])
        : null;
    finalExamType = json['finalExamType'] != null
        ? new StudentTestsExamType.fromJson(json['finalExamType'])
        : null;
    semester = json['semester'] != null
        ? new StudentTestsSemester.fromJson(json['semester'])
        : null;
    group = json['group'] != null ? new StudentTestsGroup.fromJson(json['group']) : null;
    employee = json['employee'] != null
        ? new StudentTestsEmployee.fromJson(json['employee'])
        : null;
    auditorium = json['auditorium'] != null
        ? new StudentTestsAuditorium.fromJson(json['auditorium'])
        : null;
    lessonPair = json['lessonPair'] != null
        ? new StudentTestsLessonPair.fromJson(json['lessonPair'])
        : null;
    examDate = json['examDate'];
    faculty =
    json['faculty'] != null ? new StudentTestsFaculty.fromJson(json['faculty']) : null;
    department = json['department'] != null
        ? new StudentTestsFaculty.fromJson(json['department'])
        : null;
    educationYear = json['educationYear'] != null
        ? new StudentTestsEducationYear.fromJson(json['educationYear'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    if (this.examType != null) {
      data['examType'] = this.examType!.toJson();
    }
    if (this.finalExamType != null) {
      data['finalExamType'] = this.finalExamType!.toJson();
    }
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
    }
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    if (this.auditorium != null) {
      data['auditorium'] = this.auditorium!.toJson();
    }
    if (this.lessonPair != null) {
      data['lessonPair'] = this.lessonPair!.toJson();
    }
    data['examDate'] = this.examDate;
    if (this.faculty != null) {
      data['faculty'] = this.faculty!.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.educationYear != null) {
      data['educationYear'] = this.educationYear!.toJson();
    }
    return data;
  }
}

class StudentTestsSubject {
  int? id;
  String? code;
  String? name;

  StudentTestsSubject({this.id, this.code, this.name});

  StudentTestsSubject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class StudentTestsExamType {
  String? code;
  String? name;

  StudentTestsExamType({this.code, this.name});

  StudentTestsExamType.fromJson(Map<String, dynamic> json) {
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

class StudentTestsSemester {
  int? id;
  String? code;
  String? name;
  bool? current;
  StudentTestsEducationYear? educationYear;

  StudentTestsSemester({this.id, this.code, this.name, this.current, this.educationYear});

  StudentTestsSemester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    current = json['current'];
    educationYear = json['education_year'] != null
        ? new StudentTestsEducationYear.fromJson(json['education_year'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['current'] = this.current;
    if (this.educationYear != null) {
      data['education_year'] = this.educationYear!.toJson();
    }
    return data;
  }
}

class StudentTestsEducationYear {
  String? code;
  String? name;
  bool? current;

  StudentTestsEducationYear({this.code, this.name, this.current});

  StudentTestsEducationYear.fromJson(Map<String, dynamic> json) {
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

class StudentTestsGroup {
  int? id;
  String? name;
  StudentTestsExamType? educationLang;

  StudentTestsGroup({this.id, this.name, this.educationLang});

  StudentTestsGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    educationLang = json['educationLang'] != null
        ? new StudentTestsExamType.fromJson(json['educationLang'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.educationLang != null) {
      data['educationLang'] = this.educationLang!.toJson();
    }
    return data;
  }
}

class StudentTestsEmployee {
  int? id;
  String? name;

  StudentTestsEmployee({this.id, this.name});

  StudentTestsEmployee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class StudentTestsAuditorium {
  String? code;
  String? name;
  int? volume;
  StudentTestsBuilding? building;
  StudentTestsExamType? auditoriumType;

  StudentTestsAuditorium(
      {this.code, this.name, this.volume, this.building, this.auditoriumType});

  StudentTestsAuditorium.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    volume = json['volume'];
    building = json['building'] != null
        ? new StudentTestsBuilding.fromJson(json['building'])
        : null;
    auditoriumType = json['auditoriumType'] != null
        ? new StudentTestsExamType.fromJson(json['auditoriumType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['volume'] = this.volume;
    if (this.building != null) {
      data['building'] = this.building!.toJson();
    }
    if (this.auditoriumType != null) {
      data['auditoriumType'] = this.auditoriumType!.toJson();
    }
    return data;
  }
}

class StudentTestsBuilding {
  String? id;
  String? name;

  StudentTestsBuilding({this.id, this.name});

  StudentTestsBuilding.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class StudentTestsLessonPair {
  String? code;
  String? name;
  String? startTime;
  String? endTime;
  String? sEducationYear;

  StudentTestsLessonPair(
      {this.code,
        this.name,
        this.startTime,
        this.endTime,
        this.sEducationYear});

  StudentTestsLessonPair.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    sEducationYear = json['_education_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['_education_year'] = this.sEducationYear;
    return data;
  }
}

class StudentTestsFaculty {
  int? id;
  String? name;
  String? code;
  int? parent;
  bool? active;
  StudentTestsExamType? structureType;
  StudentTestsExamType? localityType;

  StudentTestsFaculty(
      {this.id,
        this.name,
        this.code,
        this.parent,
        this.active,
        this.structureType,
        this.localityType});

  StudentTestsFaculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    parent = json['parent'];
    active = json['active'];
    structureType = json['structureType'] != null
        ? new StudentTestsExamType.fromJson(json['structureType'])
        : null;
    localityType = json['localityType'] != null
        ? new StudentTestsExamType.fromJson(json['localityType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['parent'] = this.parent;
    data['active'] = this.active;
    if (this.structureType != null) {
      data['structureType'] = this.structureType!.toJson();
    }
    if (this.localityType != null) {
      data['localityType'] = this.localityType!.toJson();
    }
    return data;
  }
}
