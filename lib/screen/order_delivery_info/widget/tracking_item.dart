
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingItem extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets separateLinePadding;
  final bool isShowSeparate;
  final bool isFirstItem;
  final Color targetColor;
  final Color firstLineColor;
  final Color secondLineColor;
  final String title;
  final String subTitle;

  const TrackingItem(
      {Key key,
        this.padding = const EdgeInsets.only(
            left: SizeUtil.normalSpace,
            right: SizeUtil.normalSpace,
            top: SizeUtil.midSmallSpace),
        this.title,
        this.subTitle,
        this.isFirstItem = false,
        this.targetColor = ColorUtil.trackingTargetColor,
        this.firstLineColor =  ColorUtil.trackingTargetColor,
        this.secondLineColor =  ColorUtil.trackingTargetColor,
        this.separateLinePadding = const EdgeInsets.all(0),
        this.isShowSeparate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              isFirstItem
                  ? SizedBox()
                  : Container(
                color: firstLineColor,
                width: 1,
                height: SizeUtil.defaultSpace,
              ),
              Icon(
                Icons.radio_button_checked,
                size: SizeUtil.iconSizeSmall,
                color: targetColor,
              ),
              Container(
                color:  ColorUtil.trackingTargetColor,
                width: 1,
                height: 24,
              )
            ],
          ),
          SizedBox(
            width: SizeUtil.smallSpace,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeExpressDetail,
                    color: targetColor),
              ),
              SizedBox(
                height: SizeUtil.tinySpace,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    color: ColorUtil.textColor),
              ),
              isShowSeparate
                  ? WidgetUtil.getLine(
                  width: 1,
                  margin: separateLinePadding,
                  color: Color(0xffDFDFDF))
                  : SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}