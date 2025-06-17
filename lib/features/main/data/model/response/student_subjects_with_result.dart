class StudentSubjectWithResultResponse {
  bool? success;
  dynamic error;
  int? code;
  List<StudentSubjectWithResultData>? data;

  StudentSubjectWithResultResponse(
      {this.success, this.error, this.code, this.data});

  StudentSubjectWithResultResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    code = json['code'];
    if (json['data'] != null) {
      data = <StudentSubjectWithResultData>[];
      json['data'].forEach((v) {
        data!.add(new StudentSubjectWithResultData.fromJson(v));
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

class StudentSubjectWithResultData {
  String? sSemester;
  StudentSubjectWithResultCurriculumSubject? curriculumSubject;
  StudentSubjectWithResultOverallScore? overallScore;

  StudentSubjectWithResultData({this.sSemester, this.curriculumSubject, this.overallScore});

  StudentSubjectWithResultData.fromJson(Map<String, dynamic> json) {
    sSemester = json['_semester'];
    curriculumSubject = json['curriculumSubject'] != null
        ? new StudentSubjectWithResultCurriculumSubject.fromJson(json['curriculumSubject'])
        : null;
    overallScore = json['overallScore'] != null
        ? new StudentSubjectWithResultOverallScore.fromJson(json['overallScore'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_semester'] = this.sSemester;
    if (this.curriculumSubject != null) {
      data['curriculumSubject'] = this.curriculumSubject!.toJson();
    }
    if (this.overallScore != null) {
      data['overallScore'] = this.overallScore!.toJson();
    }
    return data;
  }
}

class StudentSubjectWithResultCurriculumSubject {
  StudentSubjectWithResultSubject? subject;
  StudentSubjectWithResultSubjectType? subjectType;
  int? iSemester;
  int? totalAcload;
  int? credit;

  StudentSubjectWithResultCurriculumSubject(
      {this.subject,
        this.subjectType,
        this.iSemester,
        this.totalAcload,
        this.credit});

  StudentSubjectWithResultCurriculumSubject.fromJson(Map<String, dynamic> json) {
    subject =
    json['subject'] != null ? new StudentSubjectWithResultSubject.fromJson(json['subject']) : null;
    subjectType = json['subjectType'] != null
        ? new StudentSubjectWithResultSubjectType.fromJson(json['subjectType'])
        : null;
    iSemester = json['_semester'];
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
    data['_semester'] = this.iSemester;
    data['total_acload'] = this.totalAcload;
    data['credit'] = this.credit;
    return data;
  }
}

class StudentSubjectWithResultSubject {
  int? id;
  String? code;
  String? name;

  StudentSubjectWithResultSubject({this.id, this.code, this.name});

  StudentSubjectWithResultSubject.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? grade;
  int? maxBall;
  String? label;
  StudentSubjectWithResultSubjectType? examType;

  StudentSubjectWithResultOverallScore({this.id, this.grade, this.maxBall, this.label, this.examType});

  StudentSubjectWithResultOverallScore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    grade = json['grade'];
    maxBall = json['max_ball'];
    label = json['label'];
    examType = json['examType'] != null
        ? new StudentSubjectWithResultSubjectType.fromJson(json['examType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['grade'] = this.grade;
    data['max_ball'] = this.maxBall;
    data['label'] = this.label;
    if (this.examType != null) {
      data['examType'] = this.examType!.toJson();
    }
    return data;
  }
}

// -------------- MOCK DATA -----------------------------------------------

List<StudentSubjectWithResultData> mockStudentSubjects() {
  // Semestrni osonroq ko‘rish uchun int ↔ String konvertatsiya qilindi
  const int semesterNumber = 2;

  return [
    // 1. Ekologiya --------------------------------------------------------
    StudentSubjectWithResultData(
      sSemester: '$semesterNumber',
      curriculumSubject: StudentSubjectWithResultCurriculumSubject(
        subject: StudentSubjectWithResultSubject(
          id: 1,
          code: 'EKO101',
          name: 'Ekologiya',
        ),
        subjectType: StudentSubjectWithResultSubjectType(
          code: 'core',
          name: 'Majburiy',
        ),
        iSemester: semesterNumber,
        totalAcload: 128,
        credit: 4,
      ),
      overallScore: StudentSubjectWithResultOverallScore(
        id: 1001,
        grade: 0,
        maxBall: 100,
        label: 'Umumiy ball',
        examType: StudentSubjectWithResultSubjectType(
          code: 'final',
          name: 'Yakuniy',
        ),
      ),
    ),

    // 2. Ma'lumotlar Tahlili ---------------------------------------------
    StudentSubjectWithResultData(
      sSemester: '$semesterNumber',
      curriculumSubject: StudentSubjectWithResultCurriculumSubject(
        subject: StudentSubjectWithResultSubject(
          id: 2,
          code: 'DAT204',
          name: "Ma'lumotlar Tahlili",
        ),
        subjectType: StudentSubjectWithResultSubjectType(
          code: 'core',
          name: 'Majburiy',
        ),
        iSemester: semesterNumber,
        totalAcload: 128,
        credit: 4,
      ),
      overallScore: StudentSubjectWithResultOverallScore(
        id: 1002,
        grade: 74,
        maxBall: 100,
        label: 'Bronza',
        examType: StudentSubjectWithResultSubjectType(
          code: 'final',
          name: 'Yakuniy',
        ),
      ),
    ),

    // 3. Operatsion Tizimlar ---------------------------------------------
    StudentSubjectWithResultData(
      sSemester: '$semesterNumber',
      curriculumSubject: StudentSubjectWithResultCurriculumSubject(
        subject: StudentSubjectWithResultSubject(
          id: 3,
          code: 'OST203',
          name: 'Operatsion Tizimlar',
        ),
        subjectType: StudentSubjectWithResultSubjectType(
          code: 'core',
          name: 'Majburiy',
        ),
        iSemester: semesterNumber,
        totalAcload: 128,
        credit: 4,
      ),
      overallScore: StudentSubjectWithResultOverallScore(
        id: 1003,
        grade: 36,
        maxBall: 100,
        label: 'Yopiq',
        examType: StudentSubjectWithResultSubjectType(
          code: 'final',
          name: 'Yakuniy',
        ),
      ),
    ),

    // 4. Oliy Matematika --------------------------------------------------
    StudentSubjectWithResultData(
      sSemester: '$semesterNumber',
      curriculumSubject: StudentSubjectWithResultCurriculumSubject(
        subject: StudentSubjectWithResultSubject(
          id: 4,
          code: 'MAT102',
          name: 'Oliy Matematika',
        ),
        subjectType: StudentSubjectWithResultSubjectType(
          code: 'core',
          name: 'Majburiy',
        ),
        iSemester: semesterNumber,
        totalAcload: 160,
        credit: 5,
      ),
      overallScore: StudentSubjectWithResultOverallScore(
        id: 1004,
        grade: 88,
        maxBall: 100,
        label: 'Munavvar',
        examType: StudentSubjectWithResultSubjectType(
          code: 'final',
          name: 'Yakuniy',
        ),
      ),
    ),
  ];
}

