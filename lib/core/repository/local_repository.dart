import 'package:hemis_demo/core/language/language.dart';

abstract class LocalRepository {
  Future<bool> saveIsOpenOnboarding(bool isOpenOnboarding);

  Future<bool> getIsOpenOnboarding();

  Future<bool> saveRememberMe(bool rememberMe);

  Future<bool> saveId(String studentId);

  Future<String> getId();

  Future<bool> savePassword(String password);

  Future<String> getPassword();

  Future<bool> getRememberMe();

  Future<int> getPinCode();

  Future<bool> savePinCode(int pinCode);

  Future<Language?> getLanguage();

  Future<bool> saveLanguage(Language language);

  Future<String> getUserToken();

  Future<bool> saveToken(String token);
}
