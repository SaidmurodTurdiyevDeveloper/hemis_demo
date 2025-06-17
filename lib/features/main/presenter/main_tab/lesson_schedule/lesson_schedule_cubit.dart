import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/injection/injection.dart';
import '../../../data/model/response/student_lesson_schedule.dart';
import '../../../domen/repository/student_repository.dart';

part 'lesson_schedule_state.dart';

class LessonScheduleCubit extends Cubit<LessonScheduleState> {
  LessonScheduleCubit() : super(LessonScheduleState.init());
  final repository = getIt.get<StudentRepository>();

  Future<void> init() async {
    selectDay(state.selected);
  }

  Future<void> selectDay(DateTime time) async {
    emit(state.copyWith(selected: time, isLoading: true));
    var lessons = await repository.getStudentSubjectSchedule(time.weekday, 12);
    if (lessons.result != null) {
      emit(state.copyWith(lesson: lessons.result!, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getSubjects() async {
    var lessons = generateDefaultSchedule(state.selected);
    emit(state.copyWith(lesson: lessons));
  }
}
