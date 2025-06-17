import 'package:bloc/bloc.dart';
import 'package:hemis_demo/core/injection/injection.dart';
import 'package:hemis_demo/core/language/language.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/core/usecase/no_param.dart';
import 'package:meta/meta.dart';

import '../auth/domen/usecase/splash_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> openScreen() async {
    await inject();
    await Future.delayed(const Duration(seconds: 1));
    final useCase = getIt<SplashUseCase>();
    var isOpenOnboarding = await useCase.isOpenOnboarding.call(NoParam());
    var language = await useCase.getLocalLanguage.call(NoParam());
    var isRememberedUser = await useCase.isRememberedUser.call(NoParam());
    if (language == null) {
      emit(SplashOpenScreen(Screens.chooseLanguage));
    } else {
      emit(SplashChangeLocale(language));
      await Future.delayed(const Duration(seconds: 1));
      if (!isOpenOnboarding) {
        emit(SplashOpenScreen(Screens.intro));
      } else if (isRememberedUser) {
        emit(SplashOpenScreen(Screens.home));
      } else {
        emit(SplashOpenScreen(Screens.login));
      }
    }
  }
}
