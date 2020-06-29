import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ChangePasswordViewModel extends BaseViewModel{

  Future<dynamic> onChangePassword(String oldPass, String password, String rePassword) async{
    if(!WidgetUtil.verifyParams(context,params: [
      Param(key: S.of(context).old_password,value: oldPass),
      Param(key: S.of(context).new_password,value: password),
      Param(key: S.of(context).renew_password,value: rePassword),
      Param(key: S.of(context).alert_compare_pass_repass,value: password,checkType: CheckType.COMPARE_VALUE,valueConpare: rePassword)])){
      return false;
    }
    Map userInfo  = await ShareValueProvider.shareValueProvider.getUserInfo();
    String phone  = userInfo['phone'];
    dynamic data = await changePassword(context,phone: phone,password: password);
    return data;

  }

  @override
  BuildContext context;

  ChangePasswordViewModel(this.context);
}