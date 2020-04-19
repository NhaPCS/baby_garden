import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/voucher_management/provider/get_my_voucher_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../base_state.dart';
import 'widget/voucher_list.dart';

class VoucherManagement extends StatefulWidget {
  @override
  _VoucherManageState createState() => _VoucherManageState();
}

class _VoucherManageState extends BaseState<VoucherManagement> {
  GetMyVoucherProvider _getMyVoucherProvider = GetMyVoucherProvider();

  @override
  void initState() {
    super.initState();
    _getMyVoucherProvider.getMyVoucher();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final List<String> tabs = [
      S.of(context).codeTakenVoucher,
      S.of(context).expireVoucher,
      S.of(context).usedVoucher,
      S.of(context).expiredVoucher,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(title: S.of(context).voucherManage),
      body: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: SizeUtil.smallElevation,
              child: TabBar(
                labelColor: ColorUtil.grayLine,
                isScrollable: true,
                indicatorColor: ColorUtil.primaryColor,
                tabs: tabs.map((title) {
                  return Tab(
                    text: title,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: SizeUtil.smallSpace),
                child: Consumer<GetMyVoucherProvider>(
                  builder: (BuildContext context, GetMyVoucherProvider value,
                      Widget child) {
                    return TabBarView(
                      children: [
                        VoucherList(
                          vouchers: value.getCodeVouchers,
                        ),
                        VoucherList(
                          vouchers: value.unexpiredVouchers,
                          isNearExpire: true,
                        ),
                        VoucherList(
                          vouchers: value.usedVouchers,
                        ),
                        VoucherList(
                          vouchers: value.expireVouchers,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(
        value: _getMyVoucherProvider,
      )
    ];
  }
}
