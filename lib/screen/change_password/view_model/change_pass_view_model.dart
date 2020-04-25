import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ChangePasswordViewModel extends BaseViewModel{

  Future<dynamic> onChangePassword( String password) async{
    var phone = (await ShareValueProvider.shareValueProvider.getUserInfo())['phone'];
    dynamic data = await changePassword(context,phone: phone,password: password);
    if(data!=null){
      return data;
    }
    Navigator.of(context).pop();
  }
}