import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/voucher/voucherCard.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../base_state.dart';

// TODO-QAnh: khong dung folder voi screen khac
class VoucherManagement extends StatefulWidget {
  @override
  _VoucherManageState createState() => _VoucherManageState();
}

class _VoucherManageState extends BaseState<VoucherManagement> {
  final GetListProvider _getListProvider = GetListProvider();

  @override
  Widget buildWidget(BuildContext context) {
    final sampleVoucher1 = VoucherCard(
        context: context,
        description: "Voucher khuyến mãi 50% đơn hàng",
        image: 'photo/sample_voucher.png',
        partner: "Vườn Của bé",
        timeRemain: "20:20:20");

    final sampleVoucher2 = VoucherCard(
        context: context,
        description: "Voucher khuyến mãi 50% đơn hàng",
        image: 'photo/voucher30shine.png',
        partner: "30 shine");

    final List<Vouchers> vouchers = <Vouchers>[
      Vouchers(
          typeTitle: S.of(context).codeTakenVoucher,
          vouchers: [sampleVoucher1, sampleVoucher1]),
      Vouchers(
          typeTitle: S.of(context).expireVoucher,
          vouchers: [sampleVoucher1, sampleVoucher1]),
      Vouchers(
          typeTitle: S.of(context).usedVoucher,
          vouchers: [sampleVoucher2, sampleVoucher2, sampleVoucher2]),
      Vouchers(
          typeTitle: S.of(context).expiredVoucher,
          vouchers: [sampleVoucher2, sampleVoucher2])
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: vouchers.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar(title: S.of(context).voucherManage),
          // TODO-QAnh: duplicate DefaultTabController
          body: DefaultTabController(
            length: vouchers.length,
            child: Column(
              children: <Widget>[
                // TODO-QAnh: tao shadow bang elevation trong Material, bo Container nay di
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(maxHeight: 150.0),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: SizeUtil.tinyRadius,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      offset: Offset(0.0, 3.0),
                    )
                  ], border: Border.all(color: ColorUtil.darkGray, width: 0.1)),
                  child: new Material(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: ColorUtil.grayLine,
                      isScrollable: true,
                      indicatorColor: ColorUtil.primaryColor,
                      tabs: vouchers.map((Vouchers vouchers) {
                        return Tab(
                          text: vouchers.typeTitle,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: SizeUtil.smallSpace),
                    child: TabBarView(
                      children: vouchers.map((Vouchers vouchers) {
                        // TODO-QAnh: khong can truyen context
                        return VoucherList(
                            voucherList: vouchers.vouchers, context: context);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}

// TODO-QAnh: khong viet chung file, de trong data/model
class Vouchers {
  Vouchers({this.typeTitle, this.vouchers});

  final String typeTitle;
  final List<VoucherCard> vouchers;
}

// TODO-QAnh: khong viet chung file, de file rieng
class VoucherList extends StatelessWidget {
  final BuildContext context;
  VoucherList({Key key, this.voucherList, this.context}) : super(key: key);
  final List<VoucherCard> voucherList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: voucherList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(this.context).push(
                    CupertinoPageRoute(builder: (_) => VoucherDetailScreen()));
              },
              child: voucherList[index]);
        });
  }
}
