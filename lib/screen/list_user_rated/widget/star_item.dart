import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';

class StarItem extends StatelessWidget {
  final bool isSelected;
  final int star;
  final String subTitle;
  final Function ontab;

  const StarItem(
      {Key key, this.isSelected = false, this.star, this.subTitle, this.ontab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ontab,
      child: Container(
        padding: EdgeInsets.only(
            top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
        margin: EdgeInsets.only(
            left: SizeUtil.superTinySpace, right: SizeUtil.superTinySpace),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtil.white : ColorUtil.lineColor,
          borderRadius: BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
          border: Border.all(
              color: isSelected ? ColorUtil.primaryColor : ColorUtil.white,
              width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                star,
                    (index) => Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SvgIcon(
                    'ic_favorite.svg',
                    width: SizeUtil.iconSizeTiny,
                    height: SizeUtil.iconSizeTiny,
                    color: ColorUtil.primaryColor,
                  ),
                ),
              ),
            ),
            Text(subTitle, style: TextStyle(color: ColorUtil.primaryColor))
          ],
        ),
      ),
    );
  }
}