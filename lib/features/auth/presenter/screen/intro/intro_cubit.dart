import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/injection/injection.dart';
import '../../../../../core/navigator/Screens.dart';
import '../../../domen/usecase/onboarding/change_open_onboarding.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());

  void next() async {
    final useCase = getIt<ChangeOpenOnboarding>();
    await useCase.call(true);
    emit(IntroNext(route: Screens.chooseUniversity));
  }
}
