part of 'choose_language_cubit.dart';

@immutable
sealed class ChooseLanguageState {
  const ChooseLanguageState();
}

final class ChooseLanguageInitial extends ChooseLanguageState {
  const ChooseLanguageInitial();
}

final class ChooseLanguageNext extends ChooseLanguageState {
  const ChooseLanguageNext();
}

final class ChooseLanguageSelected extends ChooseLanguageState {
  final Language language;

  const ChooseLanguageSelected({required this.language});
}
