import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keybool = 'bool';
  static const _keylogin = 'login';
  static const _keypass = 'pass';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setisLogin(bool islogin) async {
    _preferences = await SharedPreferences.getInstance();

    return await _preferences?.setBool(_keybool, islogin);
  }

  static Future<bool?> getislogin() async {
    _preferences = await SharedPreferences.getInstance();

    return _preferences?.getBool(_keybool);
  }

  
  static Future setlogin(String login) async {
    _preferences = await SharedPreferences.getInstance();

    return await _preferences?.setString(_keylogin, login);
  }

  static Future<String?> getlogin() async {
    _preferences = await SharedPreferences.getInstance();

    return _preferences?.getString(_keylogin);
  }

  
  static Future setpass(String login) async {
    _preferences = await SharedPreferences.getInstance();

    return await _preferences?.setString(_keypass, login);
  }

  static Future<String?> getpass() async {
    _preferences = await SharedPreferences.getInstance();

    return _preferences?.getString(_keypass);
  }
}
