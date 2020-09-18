import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/partner_book_schedule_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_code/voucher_code_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/dialog/get_voucher_code_dialog.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nested/nested.dart';

class InfoTab extends StatefulWidget {
  final dynamic voucher;
  final VoidCallback onGetVoucherPress;

  const InfoTab({Key key, this.voucher, this.onGetVoucherPress})
      : super(key: key);

  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends BaseState<InfoTab> {
  @override
  Widget buildWidget(BuildContext context) {
    List<dynamic> imgs;
    try {
      if (widget.voucher != null && widget.voucher['img'] != null && widget.voucher['img'].runtimeType.toString().contains("List"))
        imgs = widget.voucher == null ? null : widget.voucher['img'];
    } on Exception catch (e) {
      imgs = null;
    }
    return Column(children: [
      Expanded(
        child: ListView(
          children: <Widget>[
            imgs != null
                ? Column(
                    children: imgs.map((img) {
                      return MyCachedImage(
                        url: img,
                      );
                    }).toList(),
                  )
                : SizedBox(),
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
                push(PartnerBookScheduleScreen(
                    shopID: widget.voucher['shop_id']));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
                child: Row(
                  children: <Widget>[
                    CircleImage(
                      width: 45,
                      height: 45,
                      imageUrl: widget.voucher['shop_img'],
                      borderRadius: SizeUtil.smallRadius,
                    ),
                    SizedBox(
                      width: SizeUtil.smallSpace,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(S.of(context).provided_by,
                            style: TextStyle(fontSize: SizeUtil.textSizeSmall)),
                        MyText(widget.voucher['shop_name'],
                            style: TextStyle(
                              fontSize: SizeUtil.textSizeDefault,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4A4949),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: SizeUtil.normalPadding,
        child: MyRaisedButton(
          onPressed: () {
            switch (widget.voucher['active']) {
              case "1":
                showDialog(
                    context: context,
                    builder: (BuildContext context) => GetVoucherCodeDialog(
                          onGetVoucherPress: widget.onGetVoucherPress,
                        ));
                break;
              case "2":
                push(VoucherCodeScreen(
                  context: context,
                  voucher: widget.voucher,
                ));
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
    switch (widget.voucher['take_voucher']) {
      case "1":
        return ColorUtil.primaryColor;
      case "2":
        return ColorUtil.blue;
      case "3":
      case "4":
        return ColorUtil.gray;
    }
    return ColorUtil.primaryColor;
  }

  String getVoucherStatus() {
    switch (widget.voucher['take_voucher']) {
      case "1":
        return S.of(context).voucher_get_code;
      case "2":
        return S.of(context).voucher_use_code;
      case "3":
        return S.of(context).voucher_used;
      case "4":
        return S.of(context).expiredVoucher;
    }
    return "";
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
