import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/material.dart';

class OrderOptionItem extends StatelessWidget {
  final dynamic option;

  const OrderOptionItem({Key key, @required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(1),
      padding: SizeUtil.smallPadding,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              Expanded(child: SvgIcon("${option['icon']}.svg")),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Text(
                option['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtil.textSizeSmall),
              )
            ],
          ),
          option['notify_count'] == 0
              ? SizedBox()
              : Positioned(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace,
                        top: 2,
                        bottom: 2),
                    child: Text(
                      option['notify_count'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: SizeUtil.textSizeSmall),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(SizeUtil.bigRadius)),
                        color: ColorUtil.orderBadge),
                  ),
                  right: 0,
                  top: 0)
        ],
      ),
      color: Color(0xffFBFBFB),
    );
  }
}
