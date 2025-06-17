import 'package:get_it/get_it.dart';
import 'package:hemis_demo/core/repository/local_repository.dart';
import 'package:hemis_demo/core/repository/local_repository_impl.dart';
import 'package:hemis_demo/core/storage/local_storage.dart';
import 'package:hemis_demo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:hemis_demo/features/auth/domen/repository/auth_repository.dart';
import 'package:hemis_demo/features/auth/domen/usecase/choose_language/get_local_language.dart';
import 'package:hemis_demo/features/auth/domen/usecase/choose_language/save_local_language.dart';
import 'package:hemis_demo/features/auth/domen/usecase/is_remembered_user.dart';
import 'package:hemis_demo/features/auth/domen/usecase/save_university.dart';
import 'package:hemis_demo/features/home/data/repository/student_repository_impl.dart';

import '../../features/auth/data/repositories/university_repository_impl.dart';
import '../../features/auth/domen/repository/university_repository.dart';
import '../../features/auth/domen/usecase/get_universities.dart';
import '../../features/auth/domen/usecase/login_use_case.dart';
import '../../features/auth/domen/usecase/onboarding/change_open_onboarding.dart';
import '../../features/auth/domen/usecase/onboarding/is_open_onboarding.dart';
import '../../features/auth/domen/usecase/splash_usecase.dart';
import '../../features/home/domen/repository/student_repository.dart';
import '../client/api_client.dart';

final getIt = GetIt.instance;

Future<void> inject() async {
  await Future.wait([_injectClients(), _injectRepositories(), _injectUseCases()]);

  await getIt.allReady();

}

Future<void> _injectClients() async {
  getIt.registerSingleton<ClientApi>(ApiClient());
  getIt.registerSingleton<LocalStorage>(LocalStorage());
}

Future<void> _injectRepositories() async {
  getIt.registerLazySingleton<LocalRepository>(() => LocalRepositoryImpl());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton<UniversityRepository>(() =>
      UniversityRepositoryImpl(
          getIt.get<ClientApi>(),
          getIt.get<LocalStorage>()
      ));
  getIt.registerLazySingleton<StudentRepository>(() => StudentRepositoryImpl(
      getIt.get<ClientApi>(),
      getIt.get<LocalStorage>()
  ));
}

Future<void> _injectUseCases() async {
  getIt.registerLazySingleton<ChangeOpenOnboarding>(() => ChangeOpenOnboarding());
  getIt.registerLazySingleton<SaveLocalLanguage>(() => SaveLocalLanguage());
  getIt.registerLazySingleton<GetUniversities>(() => GetUniversities());
  getIt.registerLazySingleton<SaveUniversity>(() => SaveUniversity());
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
  getIt.registerLazySingleton<SplashUseCase>(() =>
      SplashUseCase(
          isOpenOnboarding: IsOpenOnboarding(),
          getLocalLanguage: GetLocalLanguage(),
          isRememberedUser: IsRememberedUser()
      ));
}
