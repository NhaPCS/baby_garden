import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/painter/draw_triangle.dart';
import 'package:flutter/material.dart';

class VoucherItem extends StatelessWidget {
  final dynamic voucher;

  const VoucherItem({Key key, this.voucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(voucher == null) return SizedBox();
    return InkWell(
      child: Card(
        margin: EdgeInsets.only(
            left: SizeUtil.smallSpace,
            right: SizeUtil.smallSpace,
            top: SizeUtil.smallSpace),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            MyCachedImage(
              url: voucher['img'],
              width: double.infinity,
              height: 200,
            ),
            Positioned(
              left: 0,
              top: 0,
              child: CustomPaint(
                painter: DrawTriangle(color: Colors.white, offsets: [
                  Offset(0, 50),
                  Offset(50, 0),
                ]),
              ),
            ),
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  padding: SizeUtil.tinyPadding,
                  child: Transform.rotate(
                      angle: -90 * pi / 360,
                      child: AutoSizeText(
                        StringUtil.getVoucherStatus(context, voucher['active']),
                        minFontSize: SizeUtil.textSizeMini,
                        maxFontSize: SizeUtil.textSizeTiny,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            fontWeight: FontWeight.bold,
                            color: voucher['active'] == '1'
                                ? Colors.blue
                                : Colors.orange),
                      )),
                  width: 50,
                  height: 50,
                )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              padding: SizeUtil.normalPadding,
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    voucher['info'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                ),
                Row(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: "${S.of(context).period}: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "${voucher['time_end']} ${voucher['date_end']}")
                        ])),
                    Expanded(child: SizedBox()),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: [
                          TextSpan(
                              text: "${S.of(context).numberOfVoucher}: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "${voucher['number_used']}/${voucher['number']}"),
                        ])),
                  ],
                )
              ]),
            ),
            Positioned(
              bottom: 75,
              left: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: CircleImage(
                  imageUrl: voucher['shop_img'],
                  width: 28,
                  height: 28,
                  margin: EdgeInsets.all(2),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        RouteUtil.push(
            context,
            VoucherDetailScreen(
              voucher: voucher,
            ));
      },
    );
  }
}
