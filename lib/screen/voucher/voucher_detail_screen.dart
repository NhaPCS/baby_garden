import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/voucher/voucherCard.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../base_state.dart';

class VoucherDetailScreen extends StatefulWidget {
  @override
  _VoucherDetailScreenState createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends BaseState<VoucherDetailScreen> {
  final GetListProvider _getListProvider = GetListProvider();

  @override
  Widget buildWidget(BuildContext context) {
    final sampleVouchers = [
      VoucherDetail(
          image: 'photo/voucherViettel.png',
          amount: '6/20',
          period: '23:59 26/09/2019',
          description:
              '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ....',
          type: VoucherType.took),
      VoucherDetail(
          image: 'photo/voucherViettel.png',
          amount: '10/20',
          period: '23:59 26/09/2029',
          description:
              '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ....',
          type: VoucherType.took),
      VoucherDetail(
          image: 'photo/voucherViettel.png',
          amount: '9/20',
          period: '23:59 26/09/2020',
          description:
              '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ....',
          type: VoucherType.used),
      VoucherDetail(
          image: 'photo/voucherViettel.png',
          amount: '9/20',
          period: '23:59 26/09/2020',
          description:
              '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ....',
          type: VoucherType.used)
    ];

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
          typeTitle: S.of(context).information,
          vouchers: [sampleVoucher1, sampleVoucher1]),
      Vouchers(
          typeTitle: S.of(context).guide,
          vouchers: [sampleVoucher1, sampleVoucher1]),
      Vouchers(
          typeTitle: S.of(context).images,
          vouchers: [sampleVoucher2, sampleVoucher2, sampleVoucher2]),
      Vouchers(
          typeTitle: S.of(context).contact,
          vouchers: [sampleVoucher2, sampleVoucher2])
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: vouchers.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: ColorUtil.primaryColor,
              centerTitle: true,
              title: Text(S.of(context).voucherDetail)),
          body: DefaultTabController(
            length: vouchers.length,
            child: Column(
              children: <Widget>[
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
                        return VoucherList(voucherList: vouchers.vouchers);
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

class Vouchers {
  Vouchers({this.typeTitle, this.vouchers});

  final String typeTitle;
  final List<VoucherCard> vouchers;
}

class VoucherList extends StatelessWidget {
  VoucherList({Key key, this.voucherList}) : super(key: key);
  final List<VoucherCard> voucherList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: voucherList.length,
        itemBuilder: (context, index) {
          return voucherList[index];
        });
  }
}
