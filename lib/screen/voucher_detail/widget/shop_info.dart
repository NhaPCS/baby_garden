import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';

class ShopInfo extends StatelessWidget {
  final dynamic shop;

  const ShopInfo({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
      child: Row(
        children: <Widget>[
          CircleImage(
            width: 45,
            height: 45,
            imageUrl: shop['shop_img'],
            borderRadius: SizeUtil.smallRadius,
          ),
          SizedBox(
            width: SizeUtil.smallSpace,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(S.of(context).provided_by,
                  style: TextStyle(fontSize: SizeUtil.textSizeSmall)),
              MyText(shop['shop_name'],
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4A4949),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
