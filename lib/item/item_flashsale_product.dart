import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemFlashSaleProduct extends StatelessWidget {
  final double imageSize;

  const ItemFlashSaleProduct({Key key, @required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: SizeUtil.tinyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: CachedNetworkImage(
            imageUrl: StringUtil.dummyImage,
            fit: BoxFit.cover,
          )),
          Text("Sữa Alene Úc 320g"),
          Row(
            children: <Widget>[
              Text(
                "800.000 đ",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeSmall),
              ),
              Expanded(child: SizedBox()),
              Text(
                "800.000 đ",
                style: TextStyle(
                    color: ColorUtil.red, fontWeight: FontWeight.bold),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.4,
              backgroundColor: ColorUtil.bgProgressOrange,
            ),
          )
        ],
      ),
      width: imageSize,
    );
  }
}
