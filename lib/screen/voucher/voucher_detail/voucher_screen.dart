// Thông tin nhà cung cấp

import 'dart:math';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_voucher_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
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
  final GetListVoucherProvider _getListVoucherProvider = GetListVoucherProvider();
  String _selectedCategoryId;
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
  void didChangeDependencies() {
    if (_getListVoucherProvider.vouchers == null ||
        _getListVoucherProvider.vouchers.isEmpty) {
      _getListVoucherProvider.getListVoucher(0,10,"1");
    }
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).voucher.toUpperCase()),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: ListCategory(onChangedCategory: (category){
              _selectedCategoryId = category == null ? null : category['id'];
//            categoryName = category == null ?"Tất cả":category['name'];
              _getListVoucherProvider.getListVoucher(0,10,_selectedCategoryId);
            },),
          ),
          Expanded(
            child: Consumer<GetListVoucherProvider>(builder: (BuildContext context, GetListVoucherProvider value, Widget child) {
              if (value.vouchers == null || value.vouchers.isEmpty)
                return LoadingView(
                  isNoData: value.vouchers != null,
                  onReload: (){
                    _getListVoucherProvider.getListVoucher(0, 10, _selectedCategoryId);
                  },
                );
              return ListView(
                  children: sampleVouchers.map((voucher) {
                    return GestureDetector(
                      onTap: () {
                        push(VoucherDetailScreen());
                      },
                      child: Container(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: <Widget>[
                            Stack(
                                alignment: AlignmentDirectional.topStart,
                                children: [
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
                                padding: SizeUtil.normalPadding,
                                child: Column(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(voucher.description,
                                        style: TextStyle(color: Colors.black)),
                                  ),
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
                            ),
                            Positioned(
                              bottom: 82,
                              left: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(28)),
                                ),
                                child: CircleImage(
                                  imageUrl: StringUtil.dummyImage,
                                  width: 28,
                                  height: 28,
                                  margin: EdgeInsets.all(2),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList());
    }),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListVoucherProvider)];
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