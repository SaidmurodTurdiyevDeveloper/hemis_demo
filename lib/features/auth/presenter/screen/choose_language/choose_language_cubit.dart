import 'package:bloc/bloc.dart';
import 'package:hemis_demo/core/language/language.dart';
import 'package:hemis_demo/features/auth/domen/usecase/choose_language/save_local_language.dart';
import 'package:meta/meta.dart';

import '../../../../../core/injection/injection.dart';

part 'choose_language_state.dart';

class ChooseLanguageCubit extends Cubit<ChooseLanguageState> {
  ChooseLanguageCubit() : super(ChooseLanguageInitial());
  final saveUseCase = getIt<SaveLocalLanguage>();

  void changeLanguage(Language language) async {
    emit(ChooseLanguageSelected(language: language));
    await saveUseCase.call(language);
  }

  void next() => emit(ChooseLanguageNext());
}
