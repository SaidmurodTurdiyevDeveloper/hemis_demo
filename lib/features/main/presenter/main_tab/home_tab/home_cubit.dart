import 'package:bloc/bloc.dart';

import '../../../../../core/injection/injection.dart';
import '../../../data/model/response/student_gp_score_response.dart';
import '../../../data/model/response/student_subject_tasks_response.dart';
import '../../../data/model/response/user_response.dart';
import '../../../domen/repository/student_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());
  final repository = getIt.get<StudentRepository>();

  Future<void> init() async {
    await getMe();
    await getSubjects();
    await getTasks(state.semester);
  }

  Future<void> getMe() async {
    emit(state.copyWith(isLoading: true));
    var user = await repository.getStudentMe();
    if (user.result != null) {
      emit(state.copyWith(userResponseData: user.result!, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getSubjects() async {
    emit(state.copyWith(isLoading: true));
    var subjects = await repository.getStudentSubjectGpa();
    if (subjects.result != null) {
      emit(state.copyWith(subjects: subjects.result!, isLoading: false));
    } else {
      emit(state.copyWith(subjects: [], isLoading: false));
    }
  }

  Future<void> getTasks(semester) async {
    emit(state.copyWith(isLoading: true, semester: semester));
    var tasks = await repository.getStudentSubjectTasks(semester, state.page, 10);
    if (tasks.result != null) {
      emit(state.copyWith(tasks: tasks.result!, isLoading: false, page: state.page + 1, finishingPage: tasks.result!.length < 10));
    } else {
      emit(state.copyWith(tasks: [], isLoading: false));
    }
  }

  Future<void> getDefTasks() async {
    var list = createDefaultTaskList();
    emit(state.copyWith(tasks: list, isLoading: false, page: state.page + 1, finishingPage: false));
  }
}
