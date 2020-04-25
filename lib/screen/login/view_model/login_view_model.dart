import 'dart:convert';

import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends BaseViewModel{

  Future<void> onLogin({String phone, String password}) async {
    dynamic data = await login(context,
        password: password, phone: phone);
    if (data != null) {
      ShareValueProvider.shareValueProvider.saveUserInfo(jsonEncode(data));
      Provider.of<UserProvider>(context,listen: false).getUserInfo();
      RouteUtil.pushAndReplaceAll(context,MainScreen(index: 4,),"/main");
    }
  }

  @override
  BuildContext context;

  LoginViewModel(this.context);
}