import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceDetailItem extends StatelessWidget{

  const ServiceDetailItem();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(2),
        color: Color(0xffF6F6F6),
        child: Stack(
          children: <Widget>[
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
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.midSmallSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              child: Text(
                "Ủ mầm tái sinh dành cho da mặt",textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall, color: Color(0xff646464)),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                "Chi tiết",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeTiny, color: ColorUtil.blueLight),
              ),
            )
          ],
        ),
      ),
    );
  }

}