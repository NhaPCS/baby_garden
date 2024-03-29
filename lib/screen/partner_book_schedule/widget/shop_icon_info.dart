import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';

class ShopIconInfo extends StatelessWidget {
  final String icon;
  final Widget iconWidget;
  final String textData;
  final Color bgColor;
  final bool isPadding;
  final Color textColor;
  final double iconSize;
  final double textSize;
  final Function onTap;

  const ShopIconInfo(
      {this.icon = "photo/comment_img.png",
      this.textData,
      this.bgColor = ColorUtil.whiteIcon,
      this.isPadding = true,
      this.textColor = ColorUtil.textColor,
      this.iconSize = SizeUtil.iconSizeDefault,
      this.textSize = SizeUtil.textSizeSmall,
      this.onTap,
      this.iconWidget});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap != null ? onTap : () {},
      child: Container(
        padding: isPadding
            ? EdgeInsets.only(
                left: SizeUtil.midSmallSpace,
                right: SizeUtil.midSmallSpace,
                top: SizeUtil.tinySpace,
                bottom: SizeUtil.tinySpace)
            : EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius:
                BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            iconWidget != null
                ? iconWidget
                : Image.asset(
                    icon,
                    width: iconSize,
                    height: iconSize,
                  ),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            MyText(
              textData,
              style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
