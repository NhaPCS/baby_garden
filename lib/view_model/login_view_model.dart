import 'dart:convert';

import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel{

  Future<void> onLogin({String phone, String password}) async {
    dynamic data = await login(context,
        password: password, phone: phone);
    if (data != null) {
      ShareValueProvider.shareValueProvider.saveUserInfo(jsonEncode(data));
      RouteUtil.push(context,MainScreen());
    }
  }

  @override
  BuildContext context;

  LoginViewModel(this.context);
}