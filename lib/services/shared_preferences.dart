import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyName = 'name';
  static const _keyCity = 'city';
  static const _keyEmail = 'email';
  static const _keyUserID = 'userId';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  
  static Future clear() async => _preferences.clear();

  // Getter and setter for all the keys below. (Getter to be string or int setter to be Future.)
  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);
  
  static String? getUsername() => _preferences.getString(_keyUsername);

  static Future setName(String name) async =>
      await _preferences.setString(_keyName, name);
  
  static String? getName() => _preferences.getString(_keyName);

  static Future setEmail(String email) async =>
      await _preferences.setString(_keyEmail, email);
  
  static String? getEmail() => _preferences.getString(_keyEmail);

  static Future setCity(String city) async =>
      await _preferences.setString(_keyCity, city);
  
  static String? getCity() => _preferences.getString(_keyCity);

  static Future setUserId(int userId) async =>
      await _preferences.setInt(_keyUserID, userId);
  
  static int? getUserId() => _preferences.getInt(_keyUserID);
}
