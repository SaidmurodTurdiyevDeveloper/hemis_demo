import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/features/auth/presenter/screen/intro/intro_cubit.dart';
import 'package:hemis_demo/features/auth/presenter/screen/lock/pin_code_page.dart';
import 'package:hemis_demo/features/auth/presenter/screen/login/login_cubit.dart';
import 'package:hemis_demo/features/auth/presenter/screen/login/login_screen.dart';
import 'package:hemis_demo/features/splash/spalsh_screen.dart';

import '../../features/auth/presenter/screen/choose_language/choose_language.dart';
import '../../features/auth/presenter/screen/choose_language/choose_language_cubit.dart';
import '../../features/auth/presenter/screen/choose_university/choose_university_cubit.dart';
import '../../features/auth/presenter/screen/choose_university/choose_university_screen.dart';
import '../../features/auth/presenter/screen/intro/intro_screen.dart';
import '../../features/home/presenter/main_tab/home_screen.dart';
import 'error_screen.dart';

final GoRouter appRouter = GoRouter(
    initialLocation: Screens.splash,
    errorBuilder: (context, state) => const ErrorScreen(),
    routes: [
      GoRoute(path: Screens.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: Screens.intro, builder: (context, state) =>
          BlocProvider(
              create: (context) => IntroCubit(),
              child: IntroScreen()
          )),
      GoRoute(path: Screens.chooseUniversity, builder: (context, state) =>
          BlocProvider(
            create: (context) => ChooseUniversityCubit(),
            child: ChooseUniversityScreen(),
          )),
      GoRoute(path: Screens.chooseLanguage, builder: (context, state) =>
          BlocProvider(
              create: (context) => ChooseLanguageCubit(),
              child: ChooseLanguageScreen()
          )),
      GoRoute(path: Screens.login, builder: (context, state) =>
          BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          )),
      GoRoute(path: Screens.lock, builder: (context, state) => const PinCodePage()),
      GoRoute(path: Screens.home, builder: (context, state) => const HomeScreen()),
    ]
);
