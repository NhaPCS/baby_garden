import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ShareValueProvider {
  final String _user_id = "_user_id";
  final String _user_info = "_user_info";
  final String _point = "_point";
  final String _isRememberPass = "_is_remember_pass";
  final String _pass = "_pass";
  final String _user_name = "_user_name";
  final String setting_notify_product = "setting_notify_product";
  final String setting_notify_like_product_change =
      "setting_notify_like_product_change";
  final String setting_notify_service = "setting_notify_service";
  final String setting_notify_vcb_express = "setting_notify_vcb_express";
  final String token_fcm = "token_fcm";

  ShareValueProvider._();

  static final ShareValueProvider shareValueProvider = ShareValueProvider._();

  Future<bool> getIsRememberPass() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    return shareValueProvider.getBool(_isRememberPass) == null
        ? false
        : shareValueProvider.getBool(_isRememberPass);
  }

  Future<int> getPoint() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    int point = shareValueProvider.getInt(_point);
    return point;
  }

  Future<String> getUserName() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    return shareValueProvider.getString(_user_name);
  }

  Future<String> getPass() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    return shareValueProvider.getString(_pass);
  }

  Future<String> getUserId() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    String rs = shareValueProvider.getString(_user_id);
    return rs;
  }

  Future<void> saveIsRememberPass(bool val) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setBool(_isRememberPass, val);
  }

  Future<void> saveUserName(String userName) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_user_name, userName);
  }

  Future<void> savePass(String pass) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_pass, pass);
  }

  Future<void> saveUserId(String key) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_user_id, key);
  }

  Future<void> savePoint(int point) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setInt(_point, point);
  }

  Future<void> logout() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_user_id, null);
  }

  Future<Map> getUserInfo() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    String rs = shareValueProvider.getString(_user_info);
    if (rs != null && rs.isNotEmpty) {
      Map<String, dynamic> user = jsonDecode(rs);
      return user;
    }
    return null;
  }

  Future<void> saveUserInfo(String info) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_user_info, info);
  }

  Future<void> saveSetting(String setting, bool isEnable) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setBool(setting, isEnable);
  }

  Future<bool> getSetting(String setting) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    return shareValueProvider.getBool(setting);
  }

  Future<void> saveFcmToken(String token) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(token_fcm, token);
  }

  Future<String> getFcmToken() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    return shareValueProvider.getString(token_fcm);
  }
}
