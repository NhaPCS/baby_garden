import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ChangePasswordViewModel extends BaseViewModel{

  Future<dynamic> onChangePassword(String phone, String password) async{
    dynamic data = await changePassword(context,phone: phone,password: password);
    if(data!=null){
      return data;
    }
    Navigator.of(context).pop();
  }
}