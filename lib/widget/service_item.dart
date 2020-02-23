import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final bool isShowBookingDate;

  const ServiceItem({Key key, this.isShowBookingDate = true}) : super(key: key);

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
                      S.of(context).order_code("VCB19.12.25"),
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
              isShowBookingDate
                  ? Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).booking_date("25/12/2019 12:25"),
                        style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                        textAlign: TextAlign.start,
                      ),
                    )
                  : SizedBox(),
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
                    child: Image.asset("photo/rate_item_img.png",
                        width: MediaQuery.of(context).size.width / 6),
                  ),
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
                            child: Text(
                              S.of(context).overall_time("120"),
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
                            child: Text(
                              S.of(context).using_date("14.02.2019 - 10:00"),
                              style:
                                  TextStyle(fontSize: SizeUtil.textSizeSmall),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
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
                  )),
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
