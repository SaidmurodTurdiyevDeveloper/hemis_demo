class StudentAttendenceResponse {
  bool? success;
  dynamic error;
  int? code;
  List<StudentAttendenceResponseData>? data;

  StudentAttendenceResponse({this.success, this.error, this.code, this.data});

  StudentAttendenceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    code = json['code'];
    if (json['data'] != null) {
      data = <StudentAttendenceResponseData>[];
      json['data'].forEach((v) {
        data!.add(new StudentAttendenceResponseData.fromJson(v));
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

class StudentAttendenceResponseData {
  StudentAttendenceResponseSubject? subject;
  StudentAttendenceResponseSemester? semester;
  StudentAttendenceResponseTrainingType? trainingType;
  StudentAttendenceResponseLessonPair? lessonPair;
  StudentAttendenceResponseEmployee? employee;
  int? absentOn;
  int? absentOff;
  bool? explicable;
  int? lessonDate;

  StudentAttendenceResponseData(
      {this.subject,
        this.semester,
        this.trainingType,
        this.lessonPair,
        this.employee,
        this.absentOn,
        this.absentOff,
        this.explicable,
        this.lessonDate});

  StudentAttendenceResponseData.fromJson(Map<String, dynamic> json) {
    subject =
    json['subject'] != null ? new StudentAttendenceResponseSubject.fromJson(json['subject']) : null;
    semester = json['semester'] != null
        ? new StudentAttendenceResponseSemester.fromJson(json['semester'])
        : null;
    trainingType = json['trainingType'] != null
        ? new StudentAttendenceResponseTrainingType.fromJson(json['trainingType'])
        : null;
    lessonPair = json['lessonPair'] != null
        ? new StudentAttendenceResponseLessonPair.fromJson(json['lessonPair'])
        : null;
    employee = json['employee'] != null
        ? new StudentAttendenceResponseEmployee.fromJson(json['employee'])
        : null;
    absentOn = json['absent_on'];
    absentOff = json['absent_off'];
    explicable = json['explicable'];
    lessonDate = json['lesson_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
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
    data['absent_on'] = this.absentOn;
    data['absent_off'] = this.absentOff;
    data['explicable'] = this.explicable;
    data['lesson_date'] = this.lessonDate;
    return data;
  }
}

class StudentAttendenceResponseSubject {
  int? id;
  String? code;
  String? name;

  StudentAttendenceResponseSubject({this.id, this.code, this.name});

  StudentAttendenceResponseSubject.fromJson(Map<String, dynamic> json) {
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

class StudentAttendenceResponseSemester {
  int? id;
  String? code;
  String? name;
  bool? current;
  StudentAttendenceResponseEducationYear? educationYear;

  StudentAttendenceResponseSemester({this.id, this.code, this.name, this.current, this.educationYear});

  StudentAttendenceResponseSemester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    current = json['current'];
    educationYear = json['education_year'] != null
        ? new StudentAttendenceResponseEducationYear.fromJson(json['education_year'])
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

class StudentAttendenceResponseEducationYear {
  String? code;
  String? name;
  bool? current;

  StudentAttendenceResponseEducationYear({this.code, this.name, this.current});

  StudentAttendenceResponseEducationYear.fromJson(Map<String, dynamic> json) {
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

class StudentAttendenceResponseTrainingType {
  String? code;
  String? name;

  StudentAttendenceResponseTrainingType({this.code, this.name});

  StudentAttendenceResponseTrainingType.fromJson(Map<String, dynamic> json) {
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

class StudentAttendenceResponseLessonPair {
  String? code;
  String? name;
  String? startTime;
  String? endTime;
  String? sEducationYear;

  StudentAttendenceResponseLessonPair(
      {this.code,
        this.name,
        this.startTime,
        this.endTime,
        this.sEducationYear});

  StudentAttendenceResponseLessonPair.fromJson(Map<String, dynamic> json) {
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

class StudentAttendenceResponseEmployee {
  int? id;
  String? name;

  StudentAttendenceResponseEmployee({this.id, this.name});

  StudentAttendenceResponseEmployee.fromJson(Map<String, dynamic> json) {
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
