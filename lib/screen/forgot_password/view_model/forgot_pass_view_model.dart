import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel{


  Future<dynamic> onForgotPassword(String phone) async{
    dynamic data = await forgetPassword(context,phone: phone);
    if(data!=null){
      return data;
    }
  }

  Future<dynamic> onChangePassword(String phone, String password) async{
    dynamic data = await changePassword(context,phone: phone,password: password);
//    if(data!=null){
      print("onChangePassword $data");
      return data;
//    }
  }
}