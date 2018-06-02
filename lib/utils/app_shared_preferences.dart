import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_client_php_backend/utils/constants.dart';
import 'package:flutter_client_php_backend/models/User.dart';
import 'dart:convert';

import 'dart:async';

class AppSharedPreferences {
///////////////////////////////////////////////////////////////////////////////
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferenceKeys.IS_USER_LOGGED_IN);
  }

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPreferenceKeys.IS_USER_LOGGED_IN, isLoggedIn);
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<User> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User.fromJson(
        json.decode(prefs.getString(SharedPreferenceKeys.USER)));
  }

  static Future<void> setUserProfile(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(user);
    return prefs.setString(SharedPreferenceKeys.USER, userProfileJson);
  }

}
