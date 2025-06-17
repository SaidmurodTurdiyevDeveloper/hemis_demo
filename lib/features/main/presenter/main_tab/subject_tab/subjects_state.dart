part of 'subjects_cubit.dart';

class SubjectsState extends Equatable {
  final bool isLoading;
  final int semester;
  final List<StudentSubjectWithResultData> subjects;

  /// Main constructor
  const SubjectsState({
    this.isLoading = false,
    this.semester = 0,
    this.subjects = const [],
  });

  /// Initial (empty) state
  factory SubjectsState.initial() => const SubjectsState();

  /// Convenient copy‑helper
  SubjectsState copyWith({
    bool? isLoading,
    int? semester,
    List<StudentSubjectWithResultData>? subjects,
  }) {
    return SubjectsState(
      isLoading: isLoading ?? this.isLoading,
      semester: semester ?? this.semester,
      subjects: subjects ?? this.subjects,
    );
  }

  @override
  List<Object> get props => [isLoading,semester, subjects];
}
