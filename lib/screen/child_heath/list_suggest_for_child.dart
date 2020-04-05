import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:baby_garden_flutter/widget/painter/draw_triangle.dart';
import 'package:flutter/material.dart';

const double height = 30;
const double width = 50;

class ListSuggestForChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Row(
          children: <Widget>[
            Container(
              height: height,
              width: 100,
              color: ColorUtil.primaryColor,
              alignment: Alignment.center,
              child: Text(
                "Sữa",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              child: CustomPaint(
                painter: DrawTriangle(color: ColorUtil.primaryColor, offsets: [
                  Offset(width, height),
                  Offset(0, height),
                ]),
              ),
              height: height,
              width: width,
            ),
            Expanded(child: SizedBox()),
            Text(
              S.of(context).view_more,
              style: TextStyle(color: ColorUtil.primaryColor),
            )
          ],
        ),
        WidgetUtil.getLine(
            color: ColorUtil.primaryColor,
            width: 1,
            margin: EdgeInsets.only(top: 0)),
        SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Center(
                  child: CircleImage(
                    width: 100,
                    height: 100,
                    borderRadius: SizeUtil.smallRadius,
                    imageUrl: StringUtil.dummyImage,
                  ),
                );
              }),
          height: 120,
        )
      ],
    );
  }
}
