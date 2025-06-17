import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hemis_demo/core/injection/injection.dart';

import '../../../data/model/response/student_subjects_with_result.dart';
import '../../../domen/repository/student_repository.dart';

part 'subjects_state.dart';

class SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsCubit() : super(SubjectsState.initial());
  final repository = getIt.get<StudentRepository>();

  Future<void> init() async {
    getSubjectSemester(1);
  }

  Future<void> getSubjects() async {
    var subjects = mockStudentSubjects();
    emit(state.copyWith(subjects: subjects));
  }

  Future<void> getSubjectSemester(int  semester) async {
    emit(state.copyWith(isLoading: true,semester: semester));
    var subjects = await repository.getStudentSubjectResults(state.semester.toString());
    if (subjects.result != null) {
      emit(state.copyWith(subjects: subjects.result!, isLoading: false));
    } else {
      emit(state.copyWith(subjects: [], isLoading: false));
    }
  }
}
