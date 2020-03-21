import 'package:flutter/cupertino.dart';

class ButtonPartnerInfoProvider extends ChangeNotifier{
  bool isVoucherAvailable = false;
   void onChange(val){
     isVoucherAvailable = val;
     notifyListeners();
   }

}