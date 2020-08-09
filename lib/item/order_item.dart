import 'dart:math';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_order_item.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/image/svg_icon.dart';

class OrderItem extends StatelessWidget {
  final bool isRated;
  dynamic itemData;

  OrderItem({this.isRated = true, @required this.itemData}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("DATA ${itemData['list_product']}");
    dynamic productItem =
        itemData != null && itemData['list_product'].length > 0
            ? itemData['list_product'][0]
            : null;
    if (itemData == null) {
      itemData = {
        'code': "0",
        'shop_name': "",
        'date_booking': "",
        'time_booking': '',
        "shop_img": "",
        'total_money': '',
        'list_product': ''
      };
    }
    return Column(
      children: <Widget>[
        WidgetUtil.getLine(
            width: SizeUtil.tinySpace,
            color: ColorUtil.lineColor,
            margin: EdgeInsets.all(0)),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: SizeUtil.tinySpace,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      S.of(context).order_with_code(itemData['code']),
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeDefault,
                          color: ColorUtil.textColor),
                    ),
                  ),
                  RichTextForm(
                    title: S.of(context).supply_by,
                    titleStyle: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: ColorUtil.textColor),
                    content: itemData['shop_name'],
                    contentStyle: TextStyle(
                      height: 2,
                      color: ColorUtil.red,
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                  )
                ],
              ),
              Text(
                S.of(context).order_date(
                    "${itemData['date_booking']} ${itemData['time_booking']}"),
                style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeUtil.tinySpace),
                child: Text(
                  S
                      .of(context)
                      .date_of_expiration_holding(itemData['time_expired']),
                  style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: ColorUtil.gray,
              ),
              ProductOrderItem(
                title: productItem['name'],
                price: StringUtil.getPriceText(
                        productItem == null ? "" : productItem['price']) +
                    " X ",
                productCount: productItem == null ? "" : productItem['number'],
                imageUrl: productItem['image'] != null &&
                        productItem['image'].isNotEmpty
                    ? productItem['image'][0]
                    : '',
                star: isRated
                    ? int.parse(itemData['star'])
                    : null, // todo- hung  thiếu rating
              ),
              isRated
                  ? SizedBox()
                  : Center(
                      child: Text(
                        S.of(context).see_more,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorUtil.blue,
                            fontSize: SizeUtil.textSizeTiny),
                      ),
                    ),
              Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: ColorUtil.gray,
                margin: EdgeInsets.only(
                    top: isRated ? SizeUtil.smallSpace : 0,
                    bottom: isRated ? SizeUtil.tinySpace : 0),
              ),
              isRated
                  ? SizedBox()
                  : Center(
                      child: Transform.rotate(
                          angle: pi / 2,
                          child: SvgIcon(
                            'express_seemore_svg.svg',
                            width: SizeUtil.iconSizeSmall,
                            height: SizeUtil.iconSizeSmall,
                            color: ColorUtil.blue,
                          ))),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    S
                        .of(context)
                        .order_count_summary(itemData['list_product'].length),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                  )),
                  RichTextForm(
                    title: S.of(context).invoice,
                    titleStyle: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    content: StringUtil.getPriceText(itemData['total_money']),
                    contentStyle: TextStyle(
                      color: ColorUtil.red,
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeUtil.tinySpace,
              ),
            ],
          ),
        )
      ],
    );
  }
}
