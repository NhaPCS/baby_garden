import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends BaseViewModel{


  Future<dynamic> onGetVerifyCode({String phone,String name, String password,String refCode}) async{
    dynamic data  = await verifyCode(context,phone: phone,name: name,password: password,refCode: refCode);
    if(data!=null){
      return data;
    }
    return null;
  }

  Future<void> onRegister({ String name,String phone, String password,String refCode, String code}) async{
    dynamic data  = await register(context,phone: phone,name: name,password: password,refCode: refCode,code: code);
    if(data!=null){
      WidgetUtil.showMessageDialog(context,message: S.of(context).register_success,onOkClick: (){
        Navigator.of(context).pop();
      }, title: S.of(context).register);
    }
  }

  @override
  BuildContext context;

  RegisterViewModel(this.context);
}