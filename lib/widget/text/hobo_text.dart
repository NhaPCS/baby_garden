import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';

class HoboText extends StatelessWidget{
  final double fontSize;

  const HoboText({this.fontSize = SizeUtil.textSizeLogo}):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(S.of(context).app_name,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize, fontFamily: "hobo"));
  }

}