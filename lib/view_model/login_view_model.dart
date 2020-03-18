import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginViewModel implements BaseViewModel{

  Future<void> onLogin({String phone, String password}) async {
    dynamic data = await login(context,
        password: password, phone: phone);
    if (data != null) RouteUtil.push(context,MainScreen());
  }

  @override
  BuildContext context;

  LoginViewModel(this.context);
}