import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/voucher_code/provider/use_voucher_provider.dart';
import 'package:baby_garden_flutter/screen/voucher_code/view_model/voucher_code_view_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../base_state.dart';

class VoucherCodeScreen extends StatefulWidget {
  final BuildContext context;
  final dynamic voucher;

  const VoucherCodeScreen({Key key, this.context, this.voucher})
      : super(key: key);

  @override
  _VoucherCodeScreenState createState() => _VoucherCodeScreenState();
}

class _VoucherCodeScreenState
    extends BaseStateModel<VoucherCodeScreen, VoucherCodeViewModel> {
  final UserVoucherProvider _userVoucherProvider = UserVoucherProvider();
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    _userVoucherProvider.useVoucher(widget.voucher['id']);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: S.of(widget.context).voucherCode), //
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              S.of(widget.context).codeTimeRemain,
              style: TextStyle(
                  color: ColorUtil.primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              S.of(widget.context).promotionCode,
              style: TextStyle(
                  color: Color(0xff545353),
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtil.textSizeBigger),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: SizeUtil.smallSpace,
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    bottom: SizeUtil.defaultSpace),
                width: double.infinity,
                padding: const EdgeInsets.only(
                    top: SizeUtil.normalSpace, bottom: SizeUtil.normalSpace),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border:
                        Border.all(color: ColorUtil.primaryColor, width: 1)),
                alignment: Alignment.center,
                child: Consumer<UserVoucherProvider>(
                  builder: (BuildContext context, UserVoucherProvider value,
                      Widget child) {
                    return MyText(value.code,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeHuge,
                            color: ColorUtil.primaryColor));
                  },
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: setBorder('top', Color(0xffE4E4E4), 6),
            padding: SizeUtil.smallPadding,
            child: Text(
              S.of(widget.context).authenPromoCode,
              style: TextStyle(
                  color: Color(0xff545353),
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtil.textSizeBigger),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: SizeUtil.defaultSpace,
                top: SizeUtil.smallSpace,
                left: SizeUtil.smallSpace,
                right: SizeUtil.smallSpace),
            child: MyTextField(
              borderRadius: 8,
              borderColor: ColorUtil.primaryColor,
              textEditingController: _codeController,
              hint: S.of(widget.context).fillAuthenCode,
              hintStyle: TextStyle(
                  color: Color(0xff8A8787),
                  fontSize: SizeUtil.textSizeDefault,
                  fontWeight: FontWeight.w600),
            ),
          ),
          // button send code
          GestureDetector(
            onTap: () {
              //TODO
              getViewModel().verifyVoucherCode(
                  voucherId: widget.voucher['id'],
                  code: _userVoucherProvider.code);
            },
            child: Container(
              margin: SizeUtil.smallPadding,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorUtil.primaryColor),
              width: double.infinity,
              height: SizeUtil.hugSpace,
              child: Center(
                  child: Text(
                S.of(widget.context).sendCode,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeBigger, color: Colors.white),
              )),
            ),
          ),
          Center(
            child: Padding(
                padding: SizeUtil.defaultPadding,
                child: Text(S.of(widget.context).or)),
          ),

          // button scan qr code
          GestureDetector(
            onTap: () async {
              var result = await BarcodeScanner.scan();
              _codeController.text = result as String;
            },
            child: Container(
              margin: SizeUtil.smallPadding,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xfff0CA0BE)),
              width: double.infinity,
              height: SizeUtil.hugSpace,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    right: SizeUtil.smallSpace,
                    child: Icon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    S.of(widget.context).scanQRCode,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeBigger, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(
        value: _userVoucherProvider,
      )
    ];
  }

  @override
  VoucherCodeViewModel initViewModel() {
    return VoucherCodeViewModel(context);
  }
}
