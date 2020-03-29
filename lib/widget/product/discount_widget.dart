import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  final int discount;
  final double size;
  final double textSizeMax;

  const DiscountWidget(
      {Key key,
      @required this.discount,
      this.size = 30,
      this.textSizeMax = SizeUtil.textSizeSmall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(discount<=0) return SizedBox();
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      padding: SizeUtil.tinyPadding,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('photo/bg_discount.png'))),
      child: AutoSizeText(
        "${discount.toString()}%",
        maxFontSize: textSizeMax,
        minFontSize: SizeUtil.textSizeTiny,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
