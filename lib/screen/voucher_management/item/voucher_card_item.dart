import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/voucher_management/widget/remain_time.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoucherCardItem extends StatelessWidget {
  final dynamic voucher;
  final bool isNearExpire;

  const VoucherCardItem({Key key, this.voucher, this.isNearExpire = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: SizeUtil.defaultElevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorUtil.darkGray, width: 0.1),
        borderRadius: BorderRadius.circular(0),
      ),
      margin: EdgeInsets.only(top: SizeUtil.smallSpace),
      child: Padding(
        padding: SizeUtil.smallPadding,
        child: Row(children: <Widget>[
          CircleImage(
            width: 55,
            height: 55,
            borderRadius: SizeUtil.smallRadius,
            imageUrl: voucher['img'],
          ),
          SizedBox(
            width: SizeUtil.smallSpace,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                MyText(
                  voucher['title'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeUtil.smallSpace,
                ),
                Row(children: <Widget>[
                  Text(S.of(context).partner + ': ',
                      style: TextStyle(
                          color: Color.fromRGBO(8, 105, 145, 1),
                          fontWeight: FontWeight.bold)),
                  MyText(voucher['shop_name'],
                      style: TextStyle(
                        color: Color.fromRGBO(8, 105, 145, 1),
                      ))
                ]),
                SizedBox(
                  height: SizeUtil.smallSpace,
                ),
                RemainTime(
                  endDateText: voucher['date_end'],
                  endTimeText: voucher['time_end'],
                  color: isNearExpire ? ColorUtil.red : ColorUtil.textColor,
                )
              ])),
        ]),
      ),
    );
  }
}
