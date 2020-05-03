import 'package:baby_garden_flutter/data/model/point.dart';
import 'package:baby_garden_flutter/screen/point_history/point_history_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointCardItem extends StatelessWidget {
  final Point pointInfo;

  PointCardItem({Key key, this.pointInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: setBorder('bottom', Color(0xffC9C8C8), 1),
      margin: EdgeInsets.only(
          left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
      padding: EdgeInsets.all(SizeUtil.midSmallSpace),
      // TODO-QAnh: không set height như này, set height cho image và để wrap content
      child: GestureDetector(
        onTap: () {
          RouteUtil.push(
              context,
              PointHistory(
                image: 'photo/voucherVCB.png',
                name: 'VCB',
                point: 200,
              ));
        },
        child: Wrap(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
                // TODO-QAnh change to get image from network
                Image.asset(
              this.pointInfo.shopImage,
              fit: BoxFit.cover,
              width: SizeUtil.iconSizeLarge,
              height: SizeUtil.iconSizeLarge,
            ),
          ),
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
                          // TODO-QAnh: chuyển sang file arb
                          child: Text(this.pointInfo.point.toString() + ' điểm',
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
