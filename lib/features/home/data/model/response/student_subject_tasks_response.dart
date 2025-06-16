class StudentSubjectTasksResponse {
  bool? success;
  dynamic error;
  int? code;
  List<StudentSubjectTasksData>? data;

  StudentSubjectTasksResponse({this.success, this.error, this.code, this.data});

  StudentSubjectTasksResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    code = json['code'];
    if (json['data'] != null) {
      data = <StudentSubjectTasksData>[];
      json['data'].forEach((v) {
        data!.add(new StudentSubjectTasksData.fromJson(v));
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

class StudentSubjectTasksData {
  int? id;
  String? name;
  String? comment;
  int? maxBall;
  int? deadline;
  int? attemptLimit;
  StudentSubjectTasksTrainingType? trainingType;
  List<StudentSubjectTasksFiles>? files;
  StudentSubjectTasksTrainingType? taskType;
  StudentSubjectTasksTrainingType? taskStatus;
  StudentSubjectTasksEmployee? employee;
  StudentSubjectTasksStudentTaskActivity? studentTaskActivity;
  int? updatedAt;

  StudentSubjectTasksData(
      {this.id,
        this.name,
        this.comment,
        this.maxBall,
        this.deadline,
        this.attemptLimit,
        this.trainingType,
        this.files,
        this.taskType,
        this.taskStatus,
        this.employee,
        this.studentTaskActivity,
        this.updatedAt});

  StudentSubjectTasksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    comment = json['comment'];
    maxBall = json['max_ball'];
    deadline = json['deadline'];
    attemptLimit = json['attempt_limit'];
    trainingType = json['trainingType'] != null
        ? new StudentSubjectTasksTrainingType.fromJson(json['trainingType'])
        : null;
    if (json['files'] != null) {
      files = <StudentSubjectTasksFiles>[];
      json['files'].forEach((v) {
        files!.add(new StudentSubjectTasksFiles.fromJson(v));
      });
    }
    taskType = json['taskType'] != null
        ? new StudentSubjectTasksTrainingType.fromJson(json['taskType'])
        : null;
    taskStatus = json['taskStatus'] != null
        ? new StudentSubjectTasksTrainingType.fromJson(json['taskStatus'])
        : null;
    employee = json['employee'] != null
        ? new StudentSubjectTasksEmployee.fromJson(json['employee'])
        : null;
    studentTaskActivity = json['studentTaskActivity'] != null
        ? new StudentSubjectTasksStudentTaskActivity.fromJson(json['studentTaskActivity'])
        : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['comment'] = this.comment;
    data['max_ball'] = this.maxBall;
    data['deadline'] = this.deadline;
    data['attempt_limit'] = this.attemptLimit;
    if (this.trainingType != null) {
      data['trainingType'] = this.trainingType!.toJson();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    if (this.taskType != null) {
      data['taskType'] = this.taskType!.toJson();
    }
    if (this.taskStatus != null) {
      data['taskStatus'] = this.taskStatus!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    if (this.studentTaskActivity != null) {
      data['studentTaskActivity'] = this.studentTaskActivity!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class StudentSubjectTasksTrainingType {
  String? code;
  String? name;

  StudentSubjectTasksTrainingType({this.code, this.name});

  StudentSubjectTasksTrainingType.fromJson(Map<String, dynamic> json) {
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

class StudentSubjectTasksFiles {
  String? name;
  int? size;
  String? url;

  StudentSubjectTasksFiles({this.name, this.size, this.url});

  StudentSubjectTasksFiles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['size'] = this.size;
    data['url'] = this.url;
    return data;
  }
}

class StudentSubjectTasksEmployee {
  int? id;
  String? name;

  StudentSubjectTasksEmployee({this.id, this.name});

  StudentSubjectTasksEmployee.fromJson(Map<String, dynamic> json) {
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

class StudentSubjectTasksStudentTaskActivity {
  int? id;
  String? comment;
  int? iTask;
  int? sendDate;
  int? mark;
  int? markDate;
  String? markComment;
  List<StudentSubjectTasksFiles>? files;

  StudentSubjectTasksStudentTaskActivity(
      {this.id,
        this.comment,
        this.iTask,
        this.sendDate,
        this.mark,
        this.markDate,
        this.markComment,
        this.files});

  StudentSubjectTasksStudentTaskActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    iTask = json['_task'];
    sendDate = json['send_date'];
    mark = json['mark'];
    markDate = json['mark_date'];
    markComment = json['mark_comment'];
    if (json['files'] != null) {
      files = <StudentSubjectTasksFiles>[];
      json['files'].forEach((v) {
        files!.add(new StudentSubjectTasksFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['_task'] = this.iTask;
    data['send_date'] = this.sendDate;
    data['mark'] = this.mark;
    data['mark_date'] = this.markDate;
    data['mark_comment'] = this.markComment;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
