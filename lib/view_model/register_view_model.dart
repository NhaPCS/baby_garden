import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends BaseViewModel{


  Future<dynamic> onGetVerifyCode({String phone}) async{
    dynamic data  = await verifyCode(context,phone: phone);
    if(data!=null){
      return data;
    }
    return null;
  }

  Future<void> onRegister({ String name,String phone, String password,String refCode}) async{
    dynamic data  = await register(context,phone: phone,name: name,password: password,refCode: refCode);
    if(data!=null){
      print(data);
    }
  }

  @override
  BuildContext context;

  RegisterViewModel(this.context);
}