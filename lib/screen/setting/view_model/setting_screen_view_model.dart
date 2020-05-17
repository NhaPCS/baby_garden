import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class SettingScreenViewModel extends BaseViewModel{

  Future<void> onUpdateSetting (bool isEnable, int type)async{
    await configureUserNotify(context,isNoti: isEnable?"1":"0",type: type.toString());
  }

  @override
  BuildContext context;

  SettingScreenViewModel(this.context);
}