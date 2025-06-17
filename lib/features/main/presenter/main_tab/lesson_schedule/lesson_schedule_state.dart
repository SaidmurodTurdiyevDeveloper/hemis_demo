part of 'lesson_schedule_cubit.dart';

class LessonScheduleState extends Equatable {
  final today = DateTime.now();
  final bool isLoading;
  final DateTime selected;
  final List<StudentScheduleData> lesson;

  LessonScheduleState({required this.isLoading, required this.selected, required this.lesson});

  factory LessonScheduleState.init() {
    return LessonScheduleState(selected: DateTime.now(), isLoading: true, lesson: []);
  }

  LessonScheduleState copyWith({bool? isLoading, DateTime? selected, List<StudentScheduleData>? lesson}) {
    return LessonScheduleState(isLoading: isLoading ?? this.isLoading, selected: selected ?? this.selected, lesson: lesson ?? this.lesson);
  }

  @override
  List<Object?> get props => [isLoading, selected, lesson];
}

