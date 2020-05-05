import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends BaseViewModel{


  Future<dynamic> onGetVerifyCode({String phone,String name, String password,String rePass,String refCode}) async{
    if(!WidgetUtil.verifyParams(context,params: [
      Param(key: S.of(context).enter_name,value: name),
      Param(key: S.of(context).phone_format,value: phone,checkType: CheckType.PHONE_FORMAT),
      Param(key: S.of(context).password,value: password),
      Param(key: S.of(context).renew_password,value: rePass),
      Param(key: S.of(context).alert_compare_pass_repass,value: password,checkType: CheckType.COMPARE_VALUE,valueConpare: rePass),

    ])){
      return null;
    }
    dynamic data  = await verifyCode(context: context,phone: phone,name: name,password: password,refCode: refCode);
    if(data!=null){
      return data;
    }
    return null;
  }

  Future<void> onRegister({ String name,String phone, String password,String rePass,String refCode, String code}) async{
    if(!WidgetUtil.verifyParams(context,params: [
      Param(key: S.of(context).name,value: name),
      Param(key: S.of(context).phone,value: phone,checkType: CheckType.PHONE_FORMAT),
      Param(key: S.of(context).password,value: password),
      Param(key: S.of(context).renew_password,value: rePass),
      Param(key: S.of(context).alert_compare_pass_repass,value: password,checkType: CheckType.COMPARE_VALUE,valueConpare: rePass),
      Param(key: S.of(context).enter_code,value: code),
    ])){
      return null;
    }
    dynamic data  = await register(context,phone: phone,name: name,password: password,refCode: refCode,code: code);
    if(data!=null){
      WidgetUtil.showMessageDialog(context,message: S.of(context).register_success,onOkClick: (){
        Navigator.of(context).pop();
      }, title: S.of(context).success);
    }
  }

  @override
  BuildContext context;

  RegisterViewModel(this.context);
}