part of 'intro_cubit.dart';

@immutable
sealed class IntroState {}

final class IntroInitial extends IntroState {

}
final class IntroNext extends IntroState {
  final String route;

  IntroNext({required this.route});
}
