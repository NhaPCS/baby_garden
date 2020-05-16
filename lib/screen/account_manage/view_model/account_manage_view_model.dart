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
      {String name, int gender, String birthday, File img}) async {
    var data = await service.addBaby(context,
        name: name, gender: gender, birthday: birthday, img: img);
    if (data != null) {
      getListBabyProvider.listBaby();
    }
  }

  Future<void> editProfile({String name, int gender, String birthday}) async {
    await service.updateProfile(context,
        name: name, gender: gender, birthday: birthday);
  }
}
