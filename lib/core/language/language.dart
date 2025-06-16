
enum Language { uz, ru, en,uzCyrl }

String getLanguageKey(Language language) {
  switch (language) {
    case Language.uz:
      return 'uz-UZ';
    case Language.uzCyrl:
      return 'oz-UZ';
    case Language.ru:
      return 'ru-RU';
    case Language.en:
      return 'en-US';
  }
}