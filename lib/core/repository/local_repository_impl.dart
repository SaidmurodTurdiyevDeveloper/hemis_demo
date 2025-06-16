import 'package:hemis_demo/core/language/language.dart';

import '../storage/local_storage.dart';
import 'local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final localStorage = LocalStorage();

  @override
  Future<bool> getIsOpenOnboarding() => localStorage.getBool("isOpenOnboarding");

  @override
  Future<bool> getRememberMe() => localStorage.getBool("rememberMe");

  @override
  Future<String> getUserToken() => localStorage.getString("token");

  @override
  Future<bool> saveIsOpenOnboarding(bool isOpenOnboarding) => localStorage.setBool("isOpenOnboarding", isOpenOnboarding);

  @override
  Future<bool> saveRememberMe(bool rememberMe) => localStorage.setBool("rememberMe", rememberMe);

  @override
  Future<bool> saveToken(String token) => localStorage.setString("token", token);

  @override
  Future<int> getPinCode() => localStorage.getInt("pinCode");

  @override
  Future<bool> savePinCode() => localStorage.setInt("pinCode", 0);

  @override
  Future<Language?> getLanguage() async {
    var language = await localStorage.getString("language");
    if (language.isEmpty) return null;
    return Language.values.firstWhere((element) => element.name == language);
  }

  @override
  Future<bool> saveLanguage(Language language) async {
    var result = await localStorage.setString("language", language.name);
    return result;
  }

  @override
  Future<bool> saveId(String studentId) => localStorage.setString("studentId", studentId);

  @override
  Future<bool> savePassword(String password) => localStorage.setString("password", password);
}
