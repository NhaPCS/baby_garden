import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:provider/provider.dart';

class AccountManageViewModel extends BaseViewModel {
  @override
  BuildContext context;
  final GetListBabyProvider getListBabyProvider;

  AccountManageViewModel(this.context, this.getListBabyProvider);

  Future<void> addChild(
      {String babyId,
      String name,
      int gender,
      String birthday,
      File img}) async {
    var data;
    if (babyId == null) {
      data = await service.addBaby(context,
          name: name, gender: gender, birthday: birthday, img: img);
    } else {
      data = await service.editBaby(context,
          name: name,
          gender: gender,
          birthday: birthday,
          img: img,
          babyId: babyId);
    }
    if (data != null) {
      getListBabyProvider.listBaby();
    }
  }

  editProfile(BuildContext context,
      {String name, int gender, String birthday}) async {
    if (name != null && !name.toString().trim().contains(" ")) {
      WidgetUtil.showErrorDialog(context, S.of(context).mess_error_user_name);
      return;
    }
    dynamic userData =
        Provider.of<UserProvider>(context, listen: false).userInfo;
    dynamic data = await service.updateProfile(context,
        name: name ?? userData['name'],
        gender: gender == null ? userData['gender'] : gender.toString(),
        birthday: birthday == null ? userData['birthday'] : birthday);
    if (data != null) {
      Provider.of<UserProvider>(context, listen: false).updateUserData(data);
    }
  }
}
