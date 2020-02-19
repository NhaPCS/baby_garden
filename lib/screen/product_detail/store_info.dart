import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/material.dart';

class StoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleImage(
          imageUrl: StringUtil.dummyImage,
          borderRadius: SizeUtil.smallRadius,
          width: SizeUtil.iconSizeLarge,
          height: SizeUtil.iconSizeLarge,
        ),
        SizedBox(
          width: SizeUtil.smallSpace,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Vườn của bé",
              style: TextStyle(
                  color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
            ),
            RatingBar()
          ],
        )
      ],
    );
  }
}
