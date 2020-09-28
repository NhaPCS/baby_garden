import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/voucher_code/voucher_code_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/dialog/get_voucher_code_dialog.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/shop_info.dart';
import 'package:baby_garden_flutter/screen/vouchers_shop/vouchers_shop_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nested/nested.dart';

class InfoTab extends StatefulWidget {
  final dynamic voucher;
  final VoidCallback onGetVoucherPress;
  final VoidCallback onReload;

  const InfoTab({Key key, this.voucher, this.onGetVoucherPress, this.onReload})
      : super(key: key);

  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends BaseState<InfoTab> {
  @override
  Widget buildWidget(BuildContext context) {
    List<dynamic> imgs;
    try {
      if (widget.voucher != null &&
          widget.voucher['img'] != null &&
          widget.voucher['img'].runtimeType.toString().contains("List"))
        imgs = widget.voucher == null ? null : widget.voucher['img'];
    } on Exception catch (e) {
      imgs = null;
    }
    return Column(children: [
      Expanded(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: SizeUtil.smallPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Html(
                    data: widget.voucher['info'] ?? '',
                    defaultTextStyle: TextStyle(
                        color: ColorUtil.textDark,
                        fontSize: SizeUtil.textSizeDefault,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: SizeUtil.smallSpace,
                          bottom: SizeUtil.defaultSpace),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeUtil.tinyRadius),
                        color: ColorUtil.greenDarker,
                      ),
                      padding: EdgeInsets.all(SizeUtil.smallSpace),
                      child: Text(
                        S.of(context).use_to_time(widget.voucher['date_end'],
                            widget.voucher['time_end']),
                        style: TextStyle(color: Colors.white),
                      )),
                  Text(S.of(context).voucher_info,
                      style: TextStyle(
                          color: ColorUtil.textDark,
                          fontSize: SizeUtil.textSizeDefault,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  Html(
                    data: widget.voucher['instruction'] == null
                        ? ''
                        : widget.voucher['instruction'],
                  )
                ],
              ),
            ),
            WidgetUtil.getLine(width: SizeUtil.lineHeight),
            InkWell(
              onTap: () {
                push(VoucherShopScreen(
                  shopId: widget.voucher['shop_id'],
                  shopInfo: widget.voucher,
                ));
              },
              child: ShopInfo(
                shop: widget.voucher,
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: SizeUtil.normalPadding,
        child: MyRaisedButton(
          onPressed: () async {
            switch (widget.voucher['status_id'].toString()) {
              case "0":
                showDialog(
                    context: context,
                    builder: (BuildContext context) => GetVoucherCodeDialog(
                          onGetVoucherPress: widget.onGetVoucherPress,
                        ));
                break;
              case "1":
                final result = await push(VoucherCodeScreen(
                  context: context,
                  voucher: widget.voucher,
                ));
                if(result!=null && result){
                  widget.onReload();
                }
                break;
            }
          },
          matchParent: true,
          text: getVoucherStatus().toUpperCase(),
          textStyle: TextStyle(
              fontSize: SizeUtil.textSizeBigger,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          color: getVoucherColorStatus(),
          borderRadius: SizeUtil.tinyRadius,
          padding: SizeUtil.normalPadding,
        ),
      ),
    ]);
  }

  Color getVoucherColorStatus() {
    switch (widget.voucher['status_id'].toString()) {
      case "2":
        return ColorUtil.blue;
      case "3":
      case "4":
        return ColorUtil.gray;
    }
    return ColorUtil.primaryColor;
  }

  String getVoucherStatus() {
    switch (widget.voucher['status_id'].toString()) {
      case "1":
        return S.of(context).voucher_use_code;
      case "2":
        return S.of(context).expireVoucher;
      case "3":
        return S.of(context).voucher_used;
      case "4":
        return S.of(context).expiredVoucher;
    }
    return S.of(context).getCode;
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
