// Thông tin nhà cung cấp

import 'dart:math';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class VoucherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VoucherScreen();
  }
}

class _VoucherScreen extends BaseState<VoucherScreen> {
  final ChangeCategoryProvider _changeCategoryProvider =
      ChangeCategoryProvider();

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

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).provider_info),
      body: Column(
        children: <Widget>[
          Container(
            width: 60,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Cung cấp bởi"),
                    Text("CÔNG TY CỔ PHẦN VINID")
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
                children: sampleVouchers.map((voucher) {
              return Container(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Stack(alignment: AlignmentDirectional.topStart, children: [
                      ClipRect(
                        child: Image.asset(
                          voucher.image,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 9, top: 56),
                        child: CustomPaint(
                            size: Size(50, 50), painter: DrawTriangle()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, top: 18),
                        child: Transform.rotate(
                            angle: -pi / 4,
                            child: Text(
                              voucher.type == VoucherType.used
                                  ? 'Đã dùng'
                                  : voucher.type == VoucherType.took
                                      ? 'Đã lấy'
                                      : '',
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeSmall,
                                  fontWeight: FontWeight.bold,
                                  color: voucher.type == VoucherType.used
                                      ? Colors.blue
                                      : Colors.orange),
                            )),
                      )
                    ]),
                    Container(
                      margin: EdgeInsets.all(9),
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Column(children: <Widget>[
                          Text(voucher.description,
                              style: TextStyle(color: Colors.black)),
                          Row(
                            children: <Widget>[
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: "${S.of(context).period}: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: voucher.period)
                                  ])),
                              Expanded(child: SizedBox()),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      children: [
                                    TextSpan(
                                        text:
                                            "${S.of(context).numberOfVoucher}: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: voucher.amount),
                                  ])),
                            ],
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              );
            }).toList()),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeCategoryProvider)];
  }
}

class VoucherDetail {
  final String image;
  final String description;
  final VoucherType type;
  final String period;
  final String amount;

  VoucherDetail(
      {key: Key,
      this.image,
      this.type = VoucherType.expired,
      this.period,
      this.description,
      this.amount = '0/0'});
}

enum VoucherType { took, used, expired, aboutToExpire }

class DrawTriangle extends CustomPainter {
  Paint _paint;

  DrawTriangle() {
    _paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
  }

  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width, -size.height);
    path.lineTo(0, -size.height);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
