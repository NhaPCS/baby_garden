import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/loading/rounded_progress.dart';
import 'package:baby_garden_flutter/widget/product/countdown_time.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashSaleProductItem extends StatelessWidget {
  final dynamic product;

  const FlashSaleProductItem({Key key, this.product}) : super(key: key);

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
                child: MyCachedImage(
                  url: product['image'] == null || product['image'].isEmpty
                      ? ""
                      : product['image'][0],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorUtil.lightGray, width: 1)),
              )),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              MyText(
                product['name'],
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Row(
                children: <Widget>[
                  MyText(
                    StringUtil.getPriceText(product['price']),
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: ColorUtil.textGray,
                        fontSize: SizeUtil.textSizeSmall),
                  ),
                  Expanded(child: SizedBox()),
                  MyText(
                    StringUtil.getPriceText(product['price_discount']),
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
                value: StringUtil.getSalesPercent(product['number_sales'], product['number']),
                label: S.of(context).sold_count(product['number_sales'], product['number']==null?"":product['number']),
              )
            ],
          ),
          Positioned(
            child: DiscountWidget(discount: StringUtil.getDiscountPercent(product)),
            right: 0,
            top: 0,
          ),
          Positioned(
            child: CountDownTime(startTime: product['time_start'],endTime: product['time_end'],),
            left: 0,
            top: -10,
          )
        ],
      ),
      width: Provider.of<AppProvider>(context).flashSaleItemWidth,
    );
  }
}
