import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/rounded_progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemFlashSaleProduct extends StatelessWidget {
  final String imageUrl;

  const ItemFlashSaleProduct({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: SizeUtil.tinyPadding,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: SizeUtil.smallPadding,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorUtil.lightGray, width: 1)),
              )),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Text(
                "Sữa Alene Úc 320g",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
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
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              RoundedProgress(
                width: Provider.of<AppProvider>(context).flashSaleItemWidth,
                height: 18,
                label: S.of(context).sold_count("100", "200"),
              )
            ],
          ),
          Positioned(
            child: DiscountWidget(discount: 33),
            right: 0,
            top: 0,
          )
        ],
      ),
      width: Provider.of<AppProvider>(context).flashSaleItemWidth,
    );
  }
}
