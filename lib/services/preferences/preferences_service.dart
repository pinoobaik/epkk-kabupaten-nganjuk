import 'dart:convert';

import 'package:e_pkk_nganjuk/features/auth/data/model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _userKey = 'user_data';
  static const String _loginTimestampKey = 'login_timestamp';
  static const int _expiryDuration = 86400;

  static Future<void> saveUser(UserData user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
    await prefs.setInt(_loginTimestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<UserData?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString(_userKey);
    if (userData != null) {
      final user = UserData.fromJson(jsonDecode(userData));
      print('Retrieved UserID: ${user.toJson()}');
      return UserData.fromJson(jsonDecode(userData));
    }
    return null;
  }

  static Future<bool> isLoginExpired() async {
    final prefs = await SharedPreferences.getInstance();
    int? loginTimestamp = prefs.getInt(_loginTimestampKey);
    if (loginTimestamp != null) {
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final elapsedTime = currentTime - loginTimestamp;
      return elapsedTime > _expiryDuration * 1000; // Convert expiry duration to milliseconds
    }
    return true; // Jika tidak ada timestamp, anggap expired
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_loginTimestampKey);
  }
}
