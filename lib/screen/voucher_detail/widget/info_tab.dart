import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/voucher_code/voucher_code_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/provider/button_partner_info_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class InfoTab extends StatefulWidget {
  final BuildContext context;

  const InfoTab({Key key, this.context}) : super(key: key);
  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends BaseState<InfoTab> {
  final ButtonPartnerInfoProvider _buttonPartnerInfoProvider =
      new ButtonPartnerInfoProvider();
  @override
  Widget buildWidget(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView(
          children: <Widget>[
            // TODO-QAnh: khong add anh test vao asset, xoa het anh test di
            Container(
              child: Image.asset(
                'photo/voucherViettel.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  top: SizeUtil.smallSpace,
                  right: SizeUtil.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, bottom: SizeUtil.midSmallSpace),
                    child: Text(
                      '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ',
                      style: TextStyle(
                          color: ColorUtil.textDark,
                          fontSize: SizeUtil.textSizeDefault,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeUtil.tinyRadius),
                        color: Color(0xff13A208),
                      ),
                      // TODO-QAnh: trong container co padidng roi, bo Padding di
                      child: Padding(
                        padding: EdgeInsets.all(SizeUtil.smallSpace),
                        child: Text(
                          'Dùng đến: 31/09/2019 - 23h30',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Text('Thông tin Voucher',
                        style: TextStyle(
                            color: ColorUtil.textDark,
                            fontSize: SizeUtil.textSizeDefault,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: SizeUtil.smallSpace),
                    child: Text(
                        '(1) Chỉ 49.000 đ cho vé xem phim tại cụm rạp CGV ở khu vực TP.HCM'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: SizeUtil.smallSpace),
                    child: Text(
                        '(1) Chỉ 49.000 đ cho vé xem phim tại cụm rạp CGV ở khu vực TP.HCM'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: SizeUtil.smallSpace),
                    child: Image.asset('photo/ticket_voucher.png'),
                  ),
                  Container(
                    decoration: setBorder('bottom', Color(0xffF4F4F4), 5),
                    // TODO-QAnh: trong container co padidng roi, bo Padding di
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Mẫu vé CGV",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset('photo/sample_provider.png',
                              height: 43, width: 43),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Cung cấp bởi",
                                style: TextStyle(fontSize: 13)),
                            Text("CÔNG TY CỔ PHẦN VINID",
                                style: TextStyle(
                                  fontSize: SizeUtil.textSizeDefault,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff4A4949),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Consumer<ButtonPartnerInfoProvider>(
        builder: (BuildContext context, ButtonPartnerInfoProvider value,
            Widget child) {
          // TODO-QAnh: button dung MyRaisedButton
          return GestureDetector(
            child: Container(
              margin: SizeUtil.normalPadding,
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: value.isVoucherAvailable
                      ? Color(0xff0A859E)
                      : ColorUtil.primaryColor,
                  borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
              child: Center(
                child: Text(
                  value.isVoucherAvailable
                      ? S.of(widget.context).useCode.toUpperCase()
                      : S.of(widget.context).getCode.toUpperCase(),
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeBigger,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            onTap: () {
              if (value.isVoucherAvailable) {
                // go to voucher detail 6
                push(VoucherCodeScreen(context: widget.context));
              } else {
                // show dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) => getCodeDialog(context));
              }
            },
          );
        },
      )
    ]);
  }

  Widget getCodeDialog(context) {
    // TODO-QAnh: button dung MyRaisedButton
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtil.tinyRadius),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 40,
                color: ColorUtil.primaryColor,
                child: Center(
                  child: Text(S.of(context).notify,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeBigger,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: SizeUtil.defaultPadding,
                child: Text(
                  S.of(context).getCodeNotifyText,
                  style: TextStyle(fontSize: SizeUtil.textSizeBigger),
                ),
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              dialogBtn(context)
            ],
          ),
        ));
  }

  Widget dialogBtn(context) {
    // TODO-QAnh: button dung MyRaisedButton
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeUtil.defaultSpace,
          right: SizeUtil.defaultSpace,
          top: SizeUtil.defaultSpace,
          bottom: SizeUtil.biggerSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ButtonTheme(
            minWidth: 110,
            height: SizeUtil.biggerSpace,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(SizeUtil.tinyRadius),
              ),
              color: ColorUtil.colorAccent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).cancelDialog,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeBigger,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: SizeUtil.midSmallSpace,
          ),
          ButtonTheme(
            minWidth: 110,
            height: SizeUtil.biggerSpace,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(SizeUtil.tinyRadius),
              ),
              color: Color.fromRGBO(10, 133, 158, 1),
              onPressed: () async {
                // go to voucher detail 6
                Navigator.of(context).pop();
                var data =
                    await push(VoucherCodeScreen(context: widget.context));
                if (data == "sent") {}
                _buttonPartnerInfoProvider.onChange(true);
              },
              child: Text(S.of(context).agree,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeBigger,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _buttonPartnerInfoProvider),
    ];
  }
}
