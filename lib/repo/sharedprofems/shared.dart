import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keybool = 'bool';

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
}
