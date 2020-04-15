import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class RegisterPartnerViewModel extends BaseViewModel {
  @override
  BuildContext context;

  RegisterPartnerViewModel(this.context);

  Future<void> registerPartner(
      String shopName, String phone, String address, String job) async {
    if (!WidgetUtil.verifyParams(context, params: [
      Param(key: S.of(context).shopName, value: shopName),
      Param(key: S.of(context).phone, value: phone),
      Param(key: S.of(context).address, value: address),
      Param(key: S.of(context).career, value: job),
    ])) {
      return null;
    }
    dynamic data = await service.registerPartner(context,
        shopName: shopName, phone: phone, address: address, job: job);
    if (data != null) {
      WidgetUtil.showMessageDialog(context,
          message: S.of(context).register_partner_success,
          title: S.of(context).success, onOkClick: () {
        Navigator.of(context).pop();
      });
    }
  }
}
