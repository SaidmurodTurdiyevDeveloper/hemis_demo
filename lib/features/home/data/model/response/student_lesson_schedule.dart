
class StudentScheduleResponse {
  bool? success;
  dynamic error;
  int? code;
  List<StudentScheduleData>? data;

  StudentScheduleResponse({this.success, this.error, this.code, this.data});

  StudentScheduleResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    code = json['code'];
    if (json['data'] != null) {
      data = <StudentScheduleData>[];
      json['data'].forEach((v) {
        data!.add(new StudentScheduleData.fromJson(v));
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

class StudentScheduleData {
  int? id;
  StudentScheduleSubject? subject;
  StudentScheduleFaculty? faculty;
  StudentScheduleFaculty? department;
  StudentScheduleEducationYear? educationYear;
  StudentScheduleStructureType? semester;
  StudentScheduleGroup? group;
  StudentScheduleAuditorium? auditorium;
  StudentScheduleStructureType? trainingType;
  StudentScheduleLessonPair? lessonPair;
  StudentScheduleEmployee? employee;
  int? lessonDate;
  int? iWeek;
  int? weekStartTime;
  int? weekEndTime;

  StudentScheduleData(
      {this.id,
        this.subject,
        this.faculty,
        this.department,
        this.educationYear,
        this.semester,
        this.group,
        this.auditorium,
        this.trainingType,
        this.lessonPair,
        this.employee,
        this.lessonDate,
        this.iWeek,
        this.weekStartTime,
        this.weekEndTime});

  StudentScheduleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject =
    json['subject'] != null ? new StudentScheduleSubject.fromJson(json['subject']) : null;
    faculty =
    json['faculty'] != null ? new StudentScheduleFaculty.fromJson(json['faculty']) : null;
    department = json['department'] != null
        ? new StudentScheduleFaculty.fromJson(json['department'])
        : null;
    educationYear = json['educationYear'] != null
        ? new StudentScheduleEducationYear.fromJson(json['educationYear'])
        : null;
    semester = json['semester'] != null
        ? new StudentScheduleStructureType.fromJson(json['semester'])
        : null;
    group = json['group'] != null ? new StudentScheduleGroup.fromJson(json['group']) : null;
    auditorium = json['auditorium'] != null
        ? new StudentScheduleAuditorium.fromJson(json['auditorium'])
        : null;
    trainingType = json['trainingType'] != null
        ? new StudentScheduleStructureType.fromJson(json['trainingType'])
        : null;
    lessonPair = json['lessonPair'] != null
        ? new StudentScheduleLessonPair.fromJson(json['lessonPair'])
        : null;
    employee = json['employee'] != null
        ? new StudentScheduleEmployee.fromJson(json['employee'])
        : null;
    lessonDate = json['lesson_date'];
    iWeek = json['_week'];
    weekStartTime = json['weekStartTime'];
    weekEndTime = json['weekEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    if (this.faculty != null) {
      data['faculty'] = this.faculty!.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.educationYear != null) {
      data['educationYear'] = this.educationYear!.toJson();
    }
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
    }
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.auditorium != null) {
      data['auditorium'] = this.auditorium!.toJson();
    }
    if (this.trainingType != null) {
      data['trainingType'] = this.trainingType!.toJson();
    }
    if (this.lessonPair != null) {
      data['lessonPair'] = this.lessonPair!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    data['lesson_date'] = this.lessonDate;
    data['_week'] = this.iWeek;
    data['weekStartTime'] = this.weekStartTime;
    data['weekEndTime'] = this.weekEndTime;
    return data;
  }
}

class StudentScheduleSubject {
  int? id;
  String? code;
  String? name;

  StudentScheduleSubject({this.id, this.code, this.name});

  StudentScheduleSubject.fromJson(Map<String, dynamic> json) {
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

class StudentScheduleFaculty {
  int? id;
  String? name;
  String? code;
  int? parent;
  bool? active;
  StudentScheduleStructureType? structureType;
  StudentScheduleStructureType? localityType;

  StudentScheduleFaculty(
      {this.id,
        this.name,
        this.code,
        this.parent,
        this.active,
        this.structureType,
        this.localityType});

  StudentScheduleFaculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    parent = json['parent'];
    active = json['active'];
    structureType = json['structureType'] != null
        ? new StudentScheduleStructureType.fromJson(json['structureType'])
        : null;
    localityType = json['localityType'] != null
        ? new StudentScheduleStructureType.fromJson(json['localityType'])
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

class StudentScheduleStructureType {
  String? code;
  String? name;

  StudentScheduleStructureType({this.code, this.name});

  StudentScheduleStructureType.fromJson(Map<String, dynamic> json) {
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

class StudentScheduleEducationYear {
  String? code;
  String? name;
  bool? current;

  StudentScheduleEducationYear({this.code, this.name, this.current});

  StudentScheduleEducationYear.fromJson(Map<String, dynamic> json) {
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

class StudentScheduleGroup {
  int? id;
  String? name;
  StudentScheduleStructureType? educationLang;

  StudentScheduleGroup({this.id, this.name, this.educationLang});

  StudentScheduleGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    educationLang = json['educationLang'] != null
        ? new StudentScheduleStructureType.fromJson(json['educationLang'])
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

class StudentScheduleAuditorium {
  String? code;
  String? name;
  int? volume;
  StudentScheduleBuilding? building;
  StudentScheduleStructureType? auditoriumType;

  StudentScheduleAuditorium(
      {this.code, this.name, this.volume, this.building, this.auditoriumType});

  StudentScheduleAuditorium.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    volume = json['volume'];
    building = json['building'] != null
        ? new StudentScheduleBuilding.fromJson(json['building'])
        : null;
    auditoriumType = json['auditoriumType'] != null
        ? new StudentScheduleStructureType.fromJson(json['auditoriumType'])
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

class StudentScheduleBuilding {
  String? id;
  String? name;

  StudentScheduleBuilding({this.id, this.name});

  StudentScheduleBuilding.fromJson(Map<String, dynamic> json) {
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

class StudentScheduleLessonPair {
  String? code;
  String? name;
  String? startTime;
  String? endTime;
  String? sEducationYear;

  StudentScheduleLessonPair(
      {this.code,
        this.name,
        this.startTime,
        this.endTime,
        this.sEducationYear});

  StudentScheduleLessonPair.fromJson(Map<String, dynamic> json) {
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

class StudentScheduleEmployee {
  int? id;
  String? name;

  StudentScheduleEmployee({this.id, this.name});

  StudentScheduleEmployee.fromJson(Map<String, dynamic> json) {
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
