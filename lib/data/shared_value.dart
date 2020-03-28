import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ShareValueProvider {
  final String _user_id = "_user_id";
  final String _user_info = "_user_info";

  ShareValueProvider._();

  static final ShareValueProvider shareValueProvider = ShareValueProvider._();

  Future<String> getUserId() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    String rs = shareValueProvider.getString(_user_id);
    return rs;
  }

  Future<void> saveUserId(String key) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_user_id, key);
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

}
