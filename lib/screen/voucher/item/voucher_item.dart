import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/painter/draw_triangle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VoucherItem extends StatelessWidget {
  final dynamic voucher;
  final VoidCallback onItemClick;
  final bool hideStatus;

  const VoucherItem(
      {Key key, this.voucher, this.onItemClick, this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (voucher == null) return SizedBox();
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
        margin: EdgeInsets.only(
            left: SizeUtil.smallSpace,
            right: SizeUtil.smallSpace,
            top: SizeUtil.smallSpace),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: ColorUtil.lightGray,
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          voucher['img'] == null || voucher['img'].isEmpty
                              ? ''
                              : voucher['img'][0]))),
            ),
            hideStatus
                ? SizedBox()
                : Positioned(
                    left: 0,
                    top: 0,
                    child: CustomPaint(
                      painter: DrawTriangle(color: Colors.white, offsets: [
                        Offset(0, 50),
                        Offset(50, 0),
                      ]),
                    ),
                  ),
            hideStatus
                ? SizedBox()
                : Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 8, left: 7),
                      child: Transform.rotate(
                          angle: -90 * pi / 360,
                          child: AutoSizeText(
                            voucher['status_name'] ?? '',
                            minFontSize: SizeUtil.textSizeMini,
                            maxFontSize: SizeUtil.textSizeTiny,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: voucher['status_id'].toString() == '0'
                                    ? Colors.blue
                                    : Colors.orange),
                          )),
                      width: 50,
                      height: 50,
                    )),
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(SizeUtil.smallRadius)),
                  padding: SizeUtil.normalPadding,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, top: 14),
                          child: Text(
                            StringUtil.removeHtml(voucher['info']),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                            maxLines: 2,
                          ),
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
                                  TextSpan(
                                      text:
                                          "${voucher['time_end']} ${voucher['date_end']}")
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
                                  TextSpan(
                                      text:
                                          "${voucher['number_used'] ?? '0'}/${voucher['number']}"),
                                ])),
                          ],
                        )
                      ]),
                ),
                Positioned(
                    top: -14,
                    left: 30,
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
                    )),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        if (onItemClick != null) {
          onItemClick();
        }
      },
    );
  }
}
