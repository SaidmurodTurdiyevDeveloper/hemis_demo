import 'package:go_router/go_router.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/core/navigator/spalsh_screen.dart';
import 'package:hemis_demo/features/auth/presenter/screen/login/login_screen.dart';

import '../../features/auth/presenter/screen/choose_university/choose_university_screen.dart';
import '../../features/auth/presenter/screen/intro/intro_screen.dart';
import '../../features/home/presenter/main_tab/home_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: Screens.splash, builder: (context, state) => const SplashScreen()),
    GoRoute(path: Screens.intro, builder: (context, state) => const IntroScreen()),
    GoRoute(path: Screens.chooseUniversity, builder: (context, state) => const ChooseUniversityScreen()),
    GoRoute(path: Screens.login, builder: (context, state) => const LoginScreen()),
    GoRoute(path: Screens.home, builder: (context, state) => const HomeScreen()),
  ],
);
