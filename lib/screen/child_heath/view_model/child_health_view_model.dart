import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ChildHealthViewModel extends BaseViewModel {
  @override
  BuildContext context;

  ChildHealthViewModel(this.context);

  Future<bool> addTest(
      {String babyId,
      String height,
      String weight,
      String note,
      File img}) async {
    dynamic data = await service.addBabyTest(context,
        babyId: babyId, height: height, weight: weight, note: note, img: img);
    if (data != null) {
      WidgetUtil.showMessageDialog(context,
          message: S.of(context).message_add_baby_test_success,
          title: S.of(context).success);
      return true;
    } else {
      return false;
    }
  }
}
