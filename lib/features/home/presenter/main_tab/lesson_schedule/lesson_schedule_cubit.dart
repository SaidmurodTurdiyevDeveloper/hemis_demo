import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lesson_schedule_state.dart';

class LessonScheduleCubit extends Cubit<LessonScheduleState> {
  LessonScheduleCubit() : super(LessonScheduleState());
}
