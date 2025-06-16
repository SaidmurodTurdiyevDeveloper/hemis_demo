
import 'package:hemis_demo/features/auth/domen/usecase/choose_language/get_local_language.dart';

import 'is_remembered_user.dart';
import 'onboarding/is_open_onboarding.dart';

class SplashUseCase {
  final IsOpenOnboarding isOpenOnboarding;
  final GetLocalLanguage getLocalLanguage;
  final IsRememberedUser isRememberedUser;

  SplashUseCase({required this.isOpenOnboarding,required this.getLocalLanguage, required this.isRememberedUser});
}