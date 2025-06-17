import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/injection/injection.dart';
import '../../../data/model/response/user_response.dart';
import '../../../domen/repository/student_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.init());
  final repository = getIt.get<StudentRepository>();

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    var user = await repository.getStudentMe();
    if (user.result != null) {
      emit(state.copyWith(userResponseData: user.result!, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}
