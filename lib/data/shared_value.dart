import 'package:shared_preferences/shared_preferences.dart';

class ShareValueProvider {
  final String _access_token = "_access_token";

  ShareValueProvider._();

  static final ShareValueProvider shareValueProvider = ShareValueProvider._();

  Future<String> getAccessToken() async {
    final shareValueProvider = await SharedPreferences.getInstance();
    String rs = shareValueProvider.getString(_access_token);
    return rs;
  }

  Future<void> saveAccessToken(String key) async {
    final shareValueProvider = await SharedPreferences.getInstance();
    shareValueProvider.setString(_access_token, key);
  }
}
