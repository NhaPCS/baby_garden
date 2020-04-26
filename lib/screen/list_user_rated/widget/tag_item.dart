import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';

class TagItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subTitle;
  final Function ontab;

  const TagItem(
      { this.isSelected = false, this.title, this.subTitle, this.ontab})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ontab,
      child: Container(
        padding: EdgeInsets.only(
            top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
        margin: EdgeInsets.only(
            left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtil.white : ColorUtil.lineColor,
          borderRadius: BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
          border: Border.all(
              color: isSelected ? ColorUtil.primaryColor : ColorUtil.white,
              width: 1),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: title + "\n",
                style: TextStyle(color: ColorUtil.textColor)),
            TextSpan(
                text: subTitle,
                style: TextStyle(color: ColorUtil.primaryColor)),
          ]),
        ),
      ),
    );
  }
}