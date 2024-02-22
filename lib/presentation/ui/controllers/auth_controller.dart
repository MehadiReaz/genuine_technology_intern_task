import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/user_profile.dart';

class AuthController {
  static UserProfile? _userProfile;
  static String? _accessToken;

  static UserProfile? get userProfile => _userProfile;
  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
  }

  static Future<void> setProfile(UserProfile userProfile) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        'user_profile', json.encode(userProfile.toJson()));
    _userProfile = userProfile;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
  }

  static Future<void> getUserProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final userProfileString = sharedPreferences.getString('user_profile');
    if (userProfileString != null) {
      try {
        _userProfile = UserProfile.fromJson(
            Map<String, dynamic>.from(json.decode(userProfileString)));
      } catch (e) {
        log('Error decoding user profile: $e');
        // Handle the error or log it for further investigation
      }
    }
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    _accessToken = null;
    _userProfile = null;
  }

  static bool get isLoggedIn {
    return _accessToken != null && _userProfile != null;
  }
}
