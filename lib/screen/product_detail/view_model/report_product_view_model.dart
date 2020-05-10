import 'dart:io';

import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class ReportProductViewModel extends BaseViewModel {
  @override
  BuildContext context;

  ReportProductViewModel(this.context);

  Future<void> reportProduct(String productId, String title, String content,
      String titleId, File img) async {
    dynamic data = await service.reportProduct(context,
        productId: productId,
        title: titleId,
        content: content,
        titleId: titleId,
        img: img);
    if (data != null) {
      Navigator.of(context).pop();
    }
  }

  Future<void> receiveNotify({String productId}) async {
    dynamic res = await service.receiveNotify(context, productId: productId);
    print("RES $res");
    if (res != null) {
      WidgetUtil.showMessageDialog(context,
          message: S.of(context).mess_receive_notify_for_product,
          title: S.of(context).success);
    }
  }
}
