import 'education_year_entity.dart';

class SemesterEntity {
  final int id;
  final String code;
  final String name;
  final bool current;
  final EducationYearEntity educationYear;

  SemesterEntity({required this.id, required this.code, required this.name, required this.current, required this.educationYear});
}
