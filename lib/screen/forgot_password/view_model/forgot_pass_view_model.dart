import 'dart:developer';
import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  Future<dynamic> onForgotPassword(String phone) async {
    if (!WidgetUtil.verifyParams(context, params: [
      Param(
          key: S.of(context).phone_format,
          value: phone,
          checkType: CheckType.PHONE_FORMAT)
    ])) {
      return false;
    }
    dynamic data = await forgetPassword(context, phone: phone);
    if (data != null) {
      return true;
    }
    return false;
  }

  Future<dynamic> onChangePassword(
      String phone, String password, String rePass) async {
    if (!WidgetUtil.verifyParams(context, params: [
      Param(key: S.of(context).password, value: password),
      Param(key: S.of(context).reenter_password, value: rePass),
      Param(
          key: S.of(context).alert_compare_pass_repass,
          value: password,
          checkType: CheckType.COMPARE_VALUE,
          valueConpare: rePass),
    ])) {
      return false;
    }
    await changePassword(context, phone: phone, password: password);
    return true;
  }

  @override
  BuildContext context;

  ForgotPasswordViewModel(this.context);
}
