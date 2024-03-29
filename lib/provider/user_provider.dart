import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  Map userInfo = Map();
  bool isLogin = false;
  bool isRun = false;

  // bool isEditName = false;

  String userID;

  Future<void> getUserInfo() async {
    userInfo = await ShareValueProvider.shareValueProvider.getUserInfo();
    if (userInfo != null) {
      isLogin = userInfo.isNotEmpty;
      isRun = true;
      userID = userInfo['id'];
    }
    notifyListeners();
  }

  void logout(val) {
    isLogin = val;
    userInfo = Map();
    userID = "";
    notifyListeners();
  }

  void updateAvatar(String avatarUrl) {
    userInfo['avatar'] = avatarUrl;
    notifyListeners();
  }

  void updateUserData(dynamic data) {
    userInfo = data;
    notifyListeners();
  }

  List<dynamic> getEntries(BuildContext context, {String address}) {
    Map<String, String> entry(String title, String content, String icon) {
      return {'title': title, 'content': content, "icon": icon};
    }

    final List<Map<String, String>> entries = <Map<String, String>>[
      entry(S.of(context).fullname, userInfo == null ? "" : userInfo['name'],
          'pencil.png'),
      entry(S.of(context).mobilePhone,
          userInfo == null ? "" : userInfo['phone'], ''),
      entry(S.of(context).birthday,
          userInfo == null ? "" : userInfo['birthday'], ''),
      entry(
          S.of(context).gender,
          userInfo == null
              ? ""
              : userInfo['gender'] == "1"
                  ? S.of(context).male
                  : S.of(context).female,
          ''),
      entry(S.of(context).password, S.of(context).changePassword, 'right.png'),
      entry(S.of(context).address, address ?? '', 'right.png'),
    ];

    return entries;
  }
}
