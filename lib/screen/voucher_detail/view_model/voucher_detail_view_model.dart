import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/provider/get_voucher_detail_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class VoucherDetailViewModel extends BaseViewModel {
  @override
  BuildContext context;
  final GetVoucherDetailProvider getVoucherDetailProvider;

  VoucherDetailViewModel(this.context, this.getVoucherDetailProvider);

  Future<void> getCodeVoucher(String voucherId) async {
    dynamic data = await service.getCodeVoucher(context, voucherId: voucherId);
    if (data != null) {
      WidgetUtil.showMessageDialog(context,
          message: S.of(context).mess_get_code_voucher_success,
          title: S.of(context).success);
      getVoucherDetailProvider.getVoucherDetail(voucherId);
    }
  }
}
