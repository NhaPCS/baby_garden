import 'dart:io';

import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

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

  Future<void> editProfile({@required dynamic user}) async {
    print(user);
    await service.updateProfile(context,
        name: user['name'], gender: user['gender'], birthday: user['birthday']);
  }
}
