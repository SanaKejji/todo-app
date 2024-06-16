import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/auth/login_info.dart';

@LazySingleton()
class AuthStorageService {
  static const String _loginIno = "loginInfo";

  final SharedPreferences _sharedPreferences;

  AuthStorageService(this._sharedPreferences);

  Future<void> setLoginInfo(LoginInfo info) async {
    await _sharedPreferences.setString(_loginIno, json.encode(info.toJson()));
  }

  LoginInfo? getLoginInfo() {
    final loginInfo = _sharedPreferences.getString(_loginIno);
    if (loginInfo == null) {
      return null;
    }
    return LoginInfo.fromJson(json.decode(loginInfo) as Map<String, dynamic>);
  }

  Future<void> clearAuthenticationData() async {
    await _sharedPreferences.remove(_loginIno);
  }

  bool get isLoggedIn => getLoginInfo() != null;

  int? get userId => getLoginInfo()?.id;
  String? get accessToken => getLoginInfo()?.token;
  String? get refreshToken => getLoginInfo()?.refreshToken;
}
