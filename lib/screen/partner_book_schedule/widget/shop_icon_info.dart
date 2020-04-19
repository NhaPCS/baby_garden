import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';

class ShopIconInfo extends StatelessWidget{
  final String icon;
  final String textData;

  const ShopIconInfo({this.icon = "photo/comment_img.png", this.textData = "112"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
          left: SizeUtil.midSmallSpace,
          right: SizeUtil.midSmallSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.all(Radius.circular(
              SizeUtil.smallRadius))),
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[Image.asset(icon,
          width: SizeUtil.iconSizeDefault,
          height: SizeUtil.iconSizeDefault,
        ),
          SizedBox(
            width: SizeUtil.tinySpace,
          ),
          Text(
            textData,
            style: TextStyle(
                fontSize: SizeUtil.textSizeSmall,
                color: ColorUtil.textColor,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

}