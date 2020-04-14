import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedProgress extends StatelessWidget {
  final double height;
  final double width;
  final Color bgColor;
  final Color progressColor;
  final double value;
  final String label;

  const RoundedProgress(
      {Key key,
      this.height,
      this.width,
      this.bgColor = ColorUtil.bgProgressOrange,
      this.progressColor = ColorUtil.flashSaleColor,
      this.value = 0.5,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.all(Radius.circular(height))),
        ),
        Container(
          height: height,
          width: width * value,
          decoration: BoxDecoration(
              color: progressColor,
              borderRadius: BorderRadius.all(Radius.circular(height))),
        ),
        Center(
          child: Text(
            label == null ? "" : label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeUtil.textSizeSmall,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
