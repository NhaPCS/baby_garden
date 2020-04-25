import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleIconTitle extends StatelessWidget {
  final Color bgColor;
  final String img;
  final String title;
  final Function onTap;

  const CircleIconTitle({this.bgColor= ColorUtil.white, this.img, this.title, this.onTap}):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: (){
        if(onTap!=null){
          onTap();
        }
      },
      leading: Card(
          color: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
          ),
          child: Image.asset(img, width: SizeUtil.iconSizeBig)),
      title: Text(title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: SizeUtil.textSizeDefault,
          )),
    );
  }
}
