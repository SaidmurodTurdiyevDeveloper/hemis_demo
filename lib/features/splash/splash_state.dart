part of 'splash_cubit.dart';


@immutable
sealed class SplashState {
  const SplashState();
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashOpenScreen extends SplashState {
  final String screen;

  const SplashOpenScreen(this.screen);
}

final class SplashChangeLocale extends SplashState {
  final Language locale;

  const SplashChangeLocale(this.locale);
}
