import 'package:flutter/cupertino.dart';

import '../../l10n/app_localizations.dart';

class AppString {
  AppString._();

  static const String uzbek = "O’zbek tili";
  static const String uzbekCyrl = "Ўзбек тили";
  static const String russian = "Русский язык";
  static const String english = "English";

  static String hames(BuildContext context) => AppLocalizations.of(context)?.hames ?? "Hames";

  static String uzb(BuildContext context) => AppLocalizations.of(context)?.uzbek ?? "O`zbek tili";

  static String rus(BuildContext context) => AppLocalizations.of(context)?.russian ?? "Rus tili";

  static String uzbCyrl(BuildContext context) => AppLocalizations.of(context)?.uzbek_cyrl ?? "Ўзбек тили";

  static String eng(BuildContext context) => AppLocalizations.of(context)?.english ?? "Ingiliz tili";

  static String chooseLanguage(BuildContext context) => AppLocalizations.of(context)?.choose_language ?? "Tilni tanlang";

  static String chooseLanguageContinue(BuildContext context) =>
      AppLocalizations.of(context)?.choose_language_continue ?? "O’zingizga qulay tilni tanlab davom eting";

  static String next(BuildContext context) => AppLocalizations.of(context)?.next ?? "Keyingisi";

  static String introFirst(BuildContext context) =>
      AppLocalizations.of(context)?.intro_first ?? "Hayotingizni o‘zgartiruvchi bilimlarga qadam qo‘ying!";

  static String introFirstDescription(BuildContext context) =>
      AppLocalizations.of(context)?.intro_first_description ?? "Biz bilan siz zamonaviy ko‘nikmalarni oson va interaktiv tarzda o‘rganasiz.";

  static String introSecond(BuildContext context) => AppLocalizations.of(context)?.intro_second ?? "Shaxsiy rivojlanish — endi mobil ilovangizda";

  static String introSecondDescription(BuildContext context) =>
      AppLocalizations.of(context)?.intro_second_description ?? "O‘z ustingizda ishlash uchun sizga kerak bo‘lgan barcha darslar bir joyda.";

  static String introThird(BuildContext context) => AppLocalizations.of(context)?.intro_third ?? "Istalgan joyda, istalgan vaqtda o‘rganing";

  static String introThirdDescription(BuildContext context) =>
      AppLocalizations.of(context)?.intro_third_description ?? "Internet orqali 24/7 ta’lim olish imkoni. Endi o‘rganish sizga bog‘liq!";

  static String skip(BuildContext context) => AppLocalizations.of(context)?.skip ?? "O‘tkazib yuborish";

  static String login(BuildContext context) => AppLocalizations.of(context)?.login ?? "Kirish";

  static String search(BuildContext context) => AppLocalizations.of(context)?.search ?? "Qidiring";

  static String allUniversities(BuildContext context) => AppLocalizations.of(context)?.all_universities ?? "Barcha Oliy ta’lim muassasalari";

  static String chooseUniversity(BuildContext context) => AppLocalizations.of(context)?.choose_university ?? "Universitetni tanlang";

  static String chooseYourUniversity(BuildContext context) =>
      AppLocalizations.of(context)?.choose_your_university ?? "Siz o‘qiyotgan Oliy ta’lim muassasasini tanlang";

  static String enterApp(BuildContext context) => AppLocalizations.of(context)?.enter_app ?? "ILOVAGA KIRISH";

  static String enterIdAndPass(BuildContext context) =>
      AppLocalizations.of(context)?.enter_id_and_pass ?? "Iltimos talaba ID si va parolingizni kiriting";

  static String studentIdHint(BuildContext context) => AppLocalizations.of(context)?.student_id_hint ?? "Talaba ID yingizni kiriting";

  static String studentPasswordHint(BuildContext context) => AppLocalizations.of(context)?.student_password_hint ?? "Parolni kiriting";

  static String rememberMe(BuildContext context) => AppLocalizations.of(context)?.remember_me ?? "Eslab qolish";

  static String forgotPassword(BuildContext context) => AppLocalizations.of(context)?.forgot_password ?? "Parolni unutdingizmi?";

  static String emptyStudentIdError(BuildContext context) => AppLocalizations.of(context)?.empty_student_id_error ?? "Id kiritilmagan";

  static String onlyDigitsError(BuildContext context) =>
      AppLocalizations.of(context)?.only_digits_rror ?? "ID faqat raqamlardan iborat bo‘lishi kerak";

  static String emptyPasswordError(BuildContext context) => AppLocalizations.of(context)?.empty_password_error ?? "Password kiritilmagan";

  static String minPasswordError(BuildContext context) => AppLocalizations.of(context)?.min_password_error ?? "Password to`liq emas";
}
