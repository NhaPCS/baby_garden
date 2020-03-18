import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceDetailItem extends StatelessWidget{
  final bool isSelected ;
  const ServiceDetailItem({Key key,this.isSelected = false}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        padding: EdgeInsets.all(2),
        color: isSelected?ColorUtil.primaryColor:ColorUtil.serviceItemUnselectColor,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.midSmallSpace,
                  right: SizeUtil.midSmallSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              child: Text(
                "Ủ mầm tái sinh dành cho da mặt",textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12, color: isSelected?Colors.white:Color(0xff646464)),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "photo/partner_indicator_icon_blue.png",
                width: 35,
                height: 35,
              ),
            ),
            Positioned(
              top: 2,
              right: 2,
              child: Text(
                S.of(context).service_time_range("60"),
                style: TextStyle(fontSize: 7,color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                "Chi tiết",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeTiny, color: isSelected?Colors.white:ColorUtil.blueLight),
              ),
            )
          ],
        ),
      ),
    );
  }

}