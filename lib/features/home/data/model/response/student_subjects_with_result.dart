class StudentSubjectWithResultResponse {
  bool? success;
  dynamic error;
  List<StudentSubjectWithResultData>? data;
  int? code;

  StudentSubjectWithResultResponse({this.success, this.error, this.data, this.code});

  StudentSubjectWithResultResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['data'] != null) {
      data = <StudentSubjectWithResultData>[];
      json['data'].forEach((v) {
        data!.add(new StudentSubjectWithResultData.fromJson(v));
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

class StudentSubjectWithResultData {
  int? id;
  String? sSemester;
  List<dynamic>? grades;
  StudentSubjectWithResultCurriculumSubject? curriculumSubject;
  StudentSubjectWithResultOverallScore? overallScore;
  List<StudentSubjectWithResultGradesByExam>? gradesByExam;

  StudentSubjectWithResultData({this.id, this.sSemester, this.grades, this.curriculumSubject, this.overallScore, this.gradesByExam});

  StudentSubjectWithResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sSemester = json['_semester'];
    if (json['grades'] != null) {
      grades = <Null>[];
      json['grades'].forEach((v) {
        grades!.add(v);
      });
    }
    curriculumSubject = json['curriculumSubject'] != null ? new StudentSubjectWithResultCurriculumSubject.fromJson(json['curriculumSubject']) : null;
    overallScore = json['overallScore'] != null ? new StudentSubjectWithResultOverallScore.fromJson(json['overallScore']) : null;
    if (json['gradesByExam'] != null) {
      gradesByExam = <StudentSubjectWithResultGradesByExam>[];
      json['gradesByExam'].forEach((v) {
        gradesByExam!.add(new StudentSubjectWithResultGradesByExam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_semester'] = this.sSemester;
    if (this.grades != null) {
      data['grades'] = this.grades!.map((v) => v?.toJson()).toList();
    }
    if (this.curriculumSubject != null) {
      data['curriculumSubject'] = this.curriculumSubject!.toJson();
    }
    if (this.overallScore != null) {
      data['overallScore'] = this.overallScore!.toJson();
    }
    if (this.gradesByExam != null) {
      data['gradesByExam'] = this.gradesByExam!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentSubjectWithResultCurriculumSubject {
  StudentSubjectWithResultSubject? subject;
  StudentSubjectWithResultSubjectType? subjectType;
  String? sSemester;
  int? totalAcload;
  int? credit;

  StudentSubjectWithResultCurriculumSubject({this.subject, this.subjectType, this.sSemester, this.totalAcload, this.credit});

  StudentSubjectWithResultCurriculumSubject.fromJson(Map<String, dynamic> json) {
    subject = json['subject'] != null ? new StudentSubjectWithResultSubject.fromJson(json['subject']) : null;
    subjectType = json['subjectType'] != null ? new StudentSubjectWithResultSubjectType.fromJson(json['subjectType']) : null;
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

class StudentSubjectWithResultSubject {
  int? id;
  String? name;
  String? code;

  StudentSubjectWithResultSubject({this.id, this.name, this.code});

  StudentSubjectWithResultSubject.fromJson(Map<String, dynamic> json) {
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

class StudentSubjectWithResultSubjectType {
  String? code;
  String? name;

  StudentSubjectWithResultSubjectType({this.code, this.name});

  StudentSubjectWithResultSubjectType.fromJson(Map<String, dynamic> json) {
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

class StudentSubjectWithResultOverallScore {
  int? grade;
  int? maxBall;
  int? percent;
  String? label;
  StudentSubjectWithResultSubjectType? examType;

  StudentSubjectWithResultOverallScore({this.grade, this.maxBall, this.percent, this.label, this.examType});

  StudentSubjectWithResultOverallScore.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    maxBall = json['max_ball'];
    percent = json['percent'];
    label = json['label'];
    examType = json['examType'] != null ? new StudentSubjectWithResultSubjectType.fromJson(json['examType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    data['max_ball'] = this.maxBall;
    data['percent'] = this.percent;
    data['label'] = this.label;
    if (this.examType != null) {
      data['examType'] = this.examType!.toJson();
    }
    return data;
  }
}

class StudentSubjectWithResultGradesByExam {
  int? grade;
  int? maxBall;
  String? label;
  int? percent;
  StudentSubjectWithResultExamType? examType;

  StudentSubjectWithResultGradesByExam({this.grade, this.maxBall, this.label, this.percent, this.examType});

  StudentSubjectWithResultGradesByExam.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    maxBall = json['max_ball'];
    label = json['label'];
    percent = json['percent'];
    examType = json['examType'] != null ? new StudentSubjectWithResultExamType.fromJson(json['examType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    data['max_ball'] = this.maxBall;
    data['label'] = this.label;
    data['percent'] = this.percent;
    if (this.examType != null) {
      data['examType'] = this.examType!.toJson();
    }
    return data;
  }
}

class StudentSubjectWithResultExamType {
  String? code;
  String? name;

  StudentSubjectWithResultExamType({this.code, this.name});

  StudentSubjectWithResultExamType.fromJson(Map<String, dynamic> json) {
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
