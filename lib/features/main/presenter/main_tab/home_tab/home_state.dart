part of 'home_cubit.dart';

class HomeState {
  final UserResponseData? userResponseData;
  final bool isLoading;
  final bool finishingPage;
  final int page;
  final int semester;
  final List<StudentGpaScoreData> subjects;
  final List<StudentSubjectTasksData> tasks;

  const HomeState({
    this.userResponseData,
    this.isLoading = false,
    this.finishingPage = false,
    this.semester = 1,
    this.page = 0,
    this.subjects = const [],
    this.tasks = const [],
  });

  factory HomeState.init() => const HomeState();

  HomeState copyWith({
    UserResponseData? userResponseData,
    bool? isLoading,
    bool? finishingPage,
    int? semester,
    int? page,
    List<StudentGpaScoreData>? subjects,
    List<StudentSubjectTasksData>? tasks,
  }) {
    return HomeState(
      userResponseData: userResponseData ?? this.userResponseData,
      isLoading: isLoading ?? this.isLoading,
      finishingPage: finishingPage ?? this.finishingPage,
      semester: semester ?? this.semester,
      page: page ?? this.page,
      subjects: subjects ?? this.subjects,
      tasks: tasks ?? this.tasks,
    );
  }

  List<Object?> get props => [
    userResponseData,
    isLoading,
    semester,
    subjects,
    tasks,
  ];
}


