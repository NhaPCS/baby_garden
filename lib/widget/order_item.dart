import 'dart:math';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO-Hung: widget là chỗ để custom widget, không phải để item, để vào folder item
class OrderItem extends StatelessWidget {
  final bool isRated;
  final dynamic itemData;
  const OrderItem({Key key, this.isRated = true,@required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        WidgetUtil.getLine(
          width: SizeUtil.tinySpace,
          color: ColorUtil.lineColor,
          margin: EdgeInsets.all(0)
        ),
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
                      S.of(context).order_with_code("VCB19.12.25"),
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeDefault,
                          color: ColorUtil.textColor),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: S.of(context).supply_by,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: ColorUtil.textColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Vườn Của Bé",
                            style: TextStyle(
                              height: 2,
                              color: ColorUtil.red,
                              fontSize: SizeUtil.textSizeSmall,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
              Text(
                S.of(context).order_date("25/12/2019 12:25"),
                style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeUtil.tinySpace),
                child: Text(
                  S.of(context).date_of_expiration_holding("28/12/2019 12:25"),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: SizeUtil.midSmallSpace),
                    child: Image.asset("photo/order_img.png",
                        width: MediaQuery.of(context).size.width / 6),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: isRated
                                ? SizeUtil.tinySpace
                                : SizeUtil.smallSpace,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              S.of(context).order_title,
                              style:
                                  TextStyle(fontSize: SizeUtil.textSizeSmall),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: isRated
                                ? SizeUtil.tinySpace
                                : SizeUtil.defaultSpace,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: "340 000 đ X",
                                  style: TextStyle(
                                      fontSize: SizeUtil.textSizeSmall,
                                      color: ColorUtil.textColor,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: " 2",
                                      style: TextStyle(
                                        color: ColorUtil.textColor,
                                        fontSize: SizeUtil.textSizeSmall,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: SizeUtil.tinySpace,
                          ),
                          isRated
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  child: StarDisplay(value: 3),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  )
                ],
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
                    S.of(context).order_count_summary(4),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                  )),
                  RichText(
                    text: TextSpan(
                        text: S.of(context).invoice,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: ColorUtil.textColor,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: "700 000 đ",
                            style: TextStyle(
                              color: ColorUtil.red,
                              fontSize: SizeUtil.textSizeSmall,
                            ),
                          ),
                        ]),
                  ),
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

class StarDisplay extends StatelessWidget {
  final int value;
  final Color bgColor;

  final double size;

  const StarDisplay(
      {Key key,
      this.value = 0,
      this.bgColor = ColorUtil.primaryColor,
      this.size = SizeUtil.iconSizeDefault})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: bgColor,
          size: size,
        );
      }),
    );
  }
}
