
class LoginRequestBody {
  int? login;
  String? password;

  LoginRequestBody({this.login, this.password});

  LoginRequestBody.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['password'] = password;
    return data;
  }
}
