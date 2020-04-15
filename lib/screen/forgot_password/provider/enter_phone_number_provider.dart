import 'package:flutter/cupertino.dart';

class EnterPhoneNumberProvider extends ChangeNotifier{
  bool isEnterPhoneNumber = false;

  void enterPhoneNumber(String phoneNumber){
    isEnterPhoneNumber = true;
    notifyListeners();
  }

  void changeNewPass(String newPass,String reNewPass,String otp){

  }



}