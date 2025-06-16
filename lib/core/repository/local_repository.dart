import 'package:hemis_demo/core/language/language.dart';

abstract class LocalRepository {
  Future<bool> saveIsOpenOnboarding(bool isOpenOnboarding);

  Future<bool> getIsOpenOnboarding();

  Future<bool> saveRememberMe(bool rememberMe);

  Future<bool> saveId(String studentId);

  Future<bool> savePassword(String password);

  Future<bool> getRememberMe();

  Future<int> getPinCode();

  Future<bool> savePinCode();

  Future<Language?> getLanguage();

  Future<bool> saveLanguage(Language language);

  Future<String> getUserToken();

  Future<bool> saveToken(String token);
}
