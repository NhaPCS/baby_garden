import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class TabInfoScreen extends StatefulWidget {
  final BuildContext context;

  const TabInfoScreen({Key key, this.context}) : super(key: key);
  @override
  _TabInfoScreenState createState() => _TabInfoScreenState();
}

class _TabInfoScreenState extends BaseState<TabInfoScreen> {
  var buttonTitle = 'LẤY MÃ';
  final GetListProvider _getListProvider = GetListProvider();
  @override
  Widget buildWidget(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  right: SizeUtil.smallSpace, left: SizeUtil.smallSpace),
              child: Container(
                child: Image.asset(
                  'photo/voucherViettel.png',
                ),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          margin: SizeUtil.normalPadding,
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: ColorUtil.primaryColor,
              borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
          child: Center(
            child: Text(
              this.buttonTitle,
              style: TextStyle(
                  fontSize: SizeUtil.textSizeBigger,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          // show dialog
          showDialog(
              context: context,
              builder: (BuildContext context) => getCodeDialog(context));
        },
      )
    ]);
  }

  Widget getCodeDialog(context) {
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
                    'Mã khuyến mãi của bạn có hiệu lực trong 24 giờ. Bạn có muốn lấy mã không?'),
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
            minWidth: 120,
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
            minWidth: 120,
            height: SizeUtil.biggerSpace,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(SizeUtil.tinyRadius),
              ),
              color: Color.fromRGBO(10, 133, 158, 1),
              onPressed: () {
                setState(() {
                  this.buttonTitle = '';
                });

                Navigator.of(context).pop();
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
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
