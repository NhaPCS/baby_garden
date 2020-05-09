import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class VoucherCodeViewModel extends BaseViewModel {
  @override
  BuildContext context;

  VoucherCodeViewModel(this.context);

  Future<void> verifyVoucherCode({String voucherId, String code}) async {
    dynamic data = await service.verifyCodeVoucher(context, voucherId: voucherId, code: code);
  }
}
