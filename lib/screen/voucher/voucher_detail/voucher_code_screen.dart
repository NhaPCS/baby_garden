import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../../base_state.dart';

class VoucherCodeScreen extends StatefulWidget {
  final BuildContext context;

  const VoucherCodeScreen({Key key, this.context}) : super(key: key);
  @override
  _VoucherCodeScreenState createState() => _VoucherCodeScreenState();
}

class _VoucherCodeScreenState extends BaseState<VoucherCodeScreen> {
  final GetListProvider _getListProvider = GetListProvider();
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: S.of(widget.context).voucherCode), //
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border:
                          Border.all(color: ColorUtil.primaryColor, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.normalSpace,
                        bottom: SizeUtil.normalSpace),
                    child: Center(
                      child: Text('GKH 12456',
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeHuge,
                              color: ColorUtil.primaryColor)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20, top: 65),
                    child: SvgIcon(
                      'copy.svg',
                      color: Colors.black,
                      height: SizeUtil.iconSize,
                      width: SizeUtil.iconSize,
                      onPressed: () {
                        // copy to clipboard
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: setBorder('top', Color(0xffE4E4E4), 6),
              child: Padding(
                padding: SizeUtil.smallPadding,
                child: Text(
                  S.of(widget.context).authenPromoCode,
                  style: TextStyle(
                      color: Color(0xff545353),
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtil.textSizeBigger),
                ),
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
                textEditingController: null,
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
                // turn back to voucher detail infor tab and set state change button title to used
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: SizeUtil.smallPadding,
                child: Container(
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
            ),
            Center(
              child: Padding(
                  padding: SizeUtil.defaultPadding,
                  child: Text(S.of(widget.context).or)),
            ),

            // button scan qr code
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: SizeUtil.smallPadding,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff0CA0BE)),
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
