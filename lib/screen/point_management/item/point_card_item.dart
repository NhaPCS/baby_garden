import 'package:baby_garden_flutter/data/model/point.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/point_history/point_history_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointCardItem extends StatelessWidget {
  final Point pointInfo;

  PointCardItem({Key key, this.pointInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteUtil.push(
            context,
            PointHistoryScreen(
              pointInfo: pointInfo,
            ));
      },
      child: Container(
        decoration: setBorder('bottom', Color(0xffC9C8C8), 1),
        margin: EdgeInsets.only(
            left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
        padding: EdgeInsets.all(SizeUtil.midSmallSpace),
        child: Row(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(SizeUtil.smallRadius),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: this.pointInfo.shopImage,
                width: SizeUtil.iconSizeLarge,
                height: SizeUtil.iconSizeLarge,
              )),
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(SizeUtil.midSmallSpace),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(this.pointInfo.shopName,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeBigger,
                              color: ColorUtil.primaryColor,
                              fontWeight: FontWeight.bold)),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: SizeUtil.tinySpace),
                          child: Text(
                              S.of(context).numPoint(this.pointInfo.point),
                              style: TextStyle(
                                  color: ColorUtil.darkGray,
                                  fontSize: SizeUtil.textSizeBigger))),
                    ])),
          ),
          Icon(Icons.keyboard_arrow_right),
        ]),
      ),
    );
  }
}
