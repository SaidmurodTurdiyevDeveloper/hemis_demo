class Api {
  static const String baseUrl = "https://student.hemis.uz/rest";

  static const String login = "$baseUrl/v1/auth/login";
  static const String refreshToken = "$baseUrl/v1/auth/refresh-token";

  static const String mobileUniversity = "$baseUrl/v1/public/university-api-urls";

  static const String student = "$baseUrl/v1/account/me";
//barcha fanlari
  static String studentSubject(String semester) => "$baseUrl/v1/education/subjects?_semester=$semester";
  //fann natijalari
  static String studentSubjectResult(String semester) => "$baseUrl/v1/education/subject-list?semester=$semester";
  //imtihonlari
  static String studentSubjectTest(String semester) => "$baseUrl/v1/education/exam-table?semester=$semester";
  //Gpa
  static const String studentGpaScore = "$baseUrl/v1/education/gpa-list";
  //darsJadvali
  static String studentSchedule(int week,int semester) => "$baseUrl/v1/education/schedule?week=$week&semester=$semester";
  //davomati
  static String studentAttendance(String semester,String subject) => "$baseUrl/v1/education/attendance?subject=$subject&semester=$semester";
  //talaba topshiriqlari
  static String studentSubjectTasks(String semester,int page, int limit) => "$baseUrl/v1/education/task-list?semester=$semester&page=$page&limit=$limit";

}
