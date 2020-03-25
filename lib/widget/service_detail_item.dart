import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
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
        margin: EdgeInsets.only(bottom: 2, left: 1,right: 1),
        decoration: BoxDecoration(
          color: isSelected?ColorUtil.primaryColor:ColorUtil.serviceItemUnselectColor,
            shape: BoxShape.rectangle,
            // BoxShape.circle or BoxShape.retangle
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0,
              ),
            ],
        ),
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
              child: SvgIcon(
                "triangle.svg",
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