import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget{
  const OrderItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: SizeUtil.smallSpace,
          color: ColorUtil.lineColor,
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
          child: Column(
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
                              color: ColorUtil.red,
                              fontSize: SizeUtil.textSizeSmall,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).order_date("25/12/2019 12:25"),
                  style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: SizeUtil.tinySpace),
                alignment: Alignment.centerLeft,
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
                children: <Widget>[
                  Image.asset("photo/logo.png",
                      width: MediaQuery.of(context).size.width / 6),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: SizeUtil.tinySpace,
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
                            height: SizeUtil.tinySpace,
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
                          Container(
                            alignment: Alignment.centerLeft,
                            child: StarDisplay(value: 3),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: ColorUtil.gray,
                margin: EdgeInsets.only(top: SizeUtil.smallSpace,bottom: SizeUtil.tinySpace),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text(S.of(context).order_count_summary(4),style: TextStyle(fontSize: SizeUtil.textSizeTiny),)),
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
  final Color bgColor ;
  final double size;
  const StarDisplay({Key key, this.value = 0,this.bgColor = ColorUtil.primaryColor,this.size = SizeUtil.iconSizeDefault})
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
