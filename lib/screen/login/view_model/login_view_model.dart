import 'dart:convert';

import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/notify/provider/notify_control_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends BaseViewModel{

  Future<void> onLogin({String phone, String password}) async {
    if (!WidgetUtil.verifyParams(context,params: [ Param(key: S.of(context).phone,value: phone),Param(key: S.of(context).password,value: password)])){
      print("passsed");
      return null;
    }
    dynamic data = await login(context,
        password: password, phone: phone);
    if (data != null) {
      ShareValueProvider.shareValueProvider.saveUserInfo(jsonEncode(data));
      Provider.of<UserProvider>(context,listen: false).getUserInfo();
      Provider.of<NotifyProvider>(context,listen: false).getNotify();
      RouteUtil.pushAndReplaceAll(context,MainScreen(index: 4,),"/main");
    }
  }

  @override
  BuildContext context;

  LoginViewModel(this.context);
}