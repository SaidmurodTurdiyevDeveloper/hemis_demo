import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemis_demo/core/language/language.dart';
import 'package:hemis_demo/core/language/supported_locales.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(SupportedLocales.all.first);

  void change(Language language) {
    var locale = _getLocale(language);
    if (!SupportedLocales.all.contains(locale) || state == locale) return;
    emit(locale);
  }

  Locale _getLocale(Language language) {
    switch (language) {
      case Language.uz:
        return SupportedLocales.all.first;
      case Language.uzCyrl:
        return SupportedLocales.all[1];
      case Language.ru:
        return SupportedLocales.all[2];
      case Language.en:
        return SupportedLocales.all[3];
    }
  }
}
