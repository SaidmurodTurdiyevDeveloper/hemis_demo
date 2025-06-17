import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
    Locale.fromSubtags(languageCode: 'uz', scriptCode: 'Cyrl'),
  ];

  /// No description provided for @hames.
  ///
  /// In en, this message translates to:
  /// **'HAMIS'**
  String get hames;

  /// No description provided for @uzbek.
  ///
  /// In en, this message translates to:
  /// **'Uzbek language'**
  String get uzbek;

  /// No description provided for @uzbek_cyrl.
  ///
  /// In en, this message translates to:
  /// **'Uzbek language'**
  String get uzbek_cyrl;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian language'**
  String get russian;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English language'**
  String get english;

  /// No description provided for @choose_language.
  ///
  /// In en, this message translates to:
  /// **'Choose a language'**
  String get choose_language;

  /// No description provided for @choose_language_continue.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language to continue'**
  String get choose_language_continue;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @intro_first.
  ///
  /// In en, this message translates to:
  /// **'Take a step toward life-changing knowledge!'**
  String get intro_first;

  /// No description provided for @intro_first_description.
  ///
  /// In en, this message translates to:
  /// **'With us, you can easily and interactively learn modern skills.'**
  String get intro_first_description;

  /// No description provided for @intro_second.
  ///
  /// In en, this message translates to:
  /// **'Personal development — now in your mobile app'**
  String get intro_second;

  /// No description provided for @intro_second_description.
  ///
  /// In en, this message translates to:
  /// **'All the lessons you need for self-growth in one place.'**
  String get intro_second_description;

  /// No description provided for @intro_third.
  ///
  /// In en, this message translates to:
  /// **'Learn anytime, anywhere'**
  String get intro_third;

  /// No description provided for @intro_third_description.
  ///
  /// In en, this message translates to:
  /// **'Access education 24/7 through the internet. Now, learning is up to you!'**
  String get intro_third_description;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @all_universities.
  ///
  /// In en, this message translates to:
  /// **'All universities'**
  String get all_universities;

  /// No description provided for @choose_university.
  ///
  /// In en, this message translates to:
  /// **'Choose university'**
  String get choose_university;

  /// No description provided for @choose_your_university.
  ///
  /// In en, this message translates to:
  /// **'Select the university you are studying at'**
  String get choose_your_university;

  /// No description provided for @enter_app.
  ///
  /// In en, this message translates to:
  /// **'LOGIN TO THE APP'**
  String get enter_app;

  /// No description provided for @enter_id_and_pass.
  ///
  /// In en, this message translates to:
  /// **'Please enter your student ID and password'**
  String get enter_id_and_pass;

  /// No description provided for @student_id_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your student ID'**
  String get student_id_hint;

  /// No description provided for @student_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get student_password_hint;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @empty_student_id_error.
  ///
  /// In en, this message translates to:
  /// **'ID is required'**
  String get empty_student_id_error;

  /// No description provided for @only_digits_rror.
  ///
  /// In en, this message translates to:
  /// **'ID must contain digits only'**
  String get only_digits_rror;

  /// No description provided for @empty_password_error.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get empty_password_error;

  /// No description provided for @min_password_error.
  ///
  /// In en, this message translates to:
  /// **'Password is incomplete'**
  String get min_password_error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'uz':
      {
        switch (locale.scriptCode) {
          case 'Cyrl':
            return AppLocalizationsUzCyrl();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
