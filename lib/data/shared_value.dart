import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ShareValueProvider {
  final String _user_id = "_user_id";
  final String _user_info = "_user_info";
  final String _point = "_point";
  final String setting_notify_product = "setting_notify_product";
  final String setting_notify_like_product_change = "setting_notify_like_product_change";
  final String setting_notify_service = "setting_notify_service";
  final String setting_notify_vcb_express = "setting_notify_vcb_express";

  ShareValueProvider._();

  static final ShareValueProvider shareValueProvider = ShareValueProvider._();

  Future<int> getPoint() async{
    final shareValueProvider = await SharedPreferences.getInstance();
    int point = shareValueProvider.getInt(_point);
    return point;
  }

  Future<String> getUserId() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    String rs = shareValueProvider.getString(_user_id);
    return rs;
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

  Future<Map> getUserInfo() async{
    final shareValueProvider = await SharedPreferences.getInstance();
    String rs = shareValueProvider.getString(_user_info);
    Map<String, dynamic> user = jsonDecode(rs);
    return user;
  }

  Future<void> saveUserInfo(String info) async{
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_user_info, info);
  }

  Future<void> saveSetting(String setting, bool isEnable) async{
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setBool(setting, isEnable);
  }

  Future<bool> getSetting(String setting) async{
    final shareValueProvider = await SharedPreferences.getInstance();
    return shareValueProvider.getBool(setting);
  }

}
