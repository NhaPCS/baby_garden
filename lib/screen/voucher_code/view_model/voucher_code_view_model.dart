import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class VoucherCodeViewModel extends BaseViewModel {
  @override
  BuildContext context;

  VoucherCodeViewModel(this.context);

  Future<void> verifyVoucherCode({String voucherId, String code}) async {
    Response data = await service.verifyCodeVoucher(context,
        voucherId: voucherId, code: code);
    if (data != null) {
      if (data.isSuccess()) {
        WidgetUtil.showMessageDialog(context,
            message: S.of(context).verify_voucher_success,
            title: S.of(context).success);
      } else {
        WidgetUtil.showErrorDialog(context, data.message);
      }
    }
  }
}
