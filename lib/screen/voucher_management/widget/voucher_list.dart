import 'package:baby_garden_flutter/screen/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_management/item/voucher_card_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';

class VoucherList extends StatelessWidget {
  final List<dynamic> vouchers;
  final bool isNearExpire;
  final VoidCallback onReload;

  const VoucherList({Key key, this.vouchers, this.isNearExpire = false, this.onReload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (vouchers == null || vouchers.isEmpty) {
      return LoadingView(
        isNoData: true
      );
    }
    return ListView.builder(
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                RouteUtil.push(context, VoucherDetailScreen(voucher: vouchers[index],));
              },
              child: VoucherCardItem(
                voucher: vouchers[index],
                isNearExpire: isNearExpire,
              ));
        });
  }
}
