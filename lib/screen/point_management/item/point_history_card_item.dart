import 'package:baby_garden_flutter/data/model/PointDetail.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointHistoryCardItem extends StatelessWidget {
  final PointDetail pointDetail;

  PointHistoryCardItem({Key key, this.pointDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.pointDetail.changePoint);
    return Container(
      decoration: setBorder('bottom', ColorUtil.lineLightGray, 1),
      margin: EdgeInsets.only(
          left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
      padding: EdgeInsets.only(
          top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
      child: Row(children: <Widget>[
        CircleImage(
            borderRadius: SizeUtil.smallRadius,
            width: SizeUtil.iconSizeLarge,
            height: SizeUtil.iconSizeLarge,
            imageUrl: this.pointDetail.shopImage),
        SizedBox(width: SizeUtil.smallSpace),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text(this.pointDetail.history,
                  style: TextStyle(
                      color: ColorUtil.black33, fontWeight: FontWeight.bold)),
              SizedBox(
                height: SizeUtil.midSmallSpace,
              ),
              Text(this.pointDetail.dateTime,
                  style: TextStyle(
                      color: ColorUtil.textHint,
                      fontSize: SizeUtil.textSizeSmall))
            ])),
        Column(children: <Widget>[
          Text(this.pointDetail.currentPoint.toString(),
              style: TextStyle(
                  color: ColorUtil.textHint, fontSize: SizeUtil.textSizeSmall)),
          SizedBox(
            height: SizeUtil.midSmallSpace,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Text(
              this.pointDetail.type == 1
                  ? '+ ' + S.of(context).numPoint(this.pointDetail.changePoint)
                  : '- ' + this.pointDetail.changePoint.abs().toString(),
              style: TextStyle(
                  fontSize: SizeUtil.textSizeSmall,
                  color: this.pointDetail.type == 1
                      ? Color.fromRGBO(0, 119, 255, 1)
                      : Colors.red),
            ),
          ),
        ]),
      ]),
    );
  }
}
