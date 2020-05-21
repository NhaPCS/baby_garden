import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final bool isShowBookingDate;
  final dynamic itemData;

  ServiceItem(
      {Key key, this.isShowBookingDate = true,this.itemData})
      : super(key: key);

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
                      S.of(context).booking_code(itemData['code']),
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
                            text: itemData['shop_name'],
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
                        S.of(context).booking_date(itemData['date_booking']),
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
                    child: CachedNetworkImage(
                      imageUrl: itemData['shop_img']==""?StringUtil.dummyImage:itemData['shop_img'],
                      width: MediaQuery.of(context).size.width / 6,
                    ),
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
                              itemData['service_name']==null?"":itemData['service_name'],
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeExpressDetail,
                                  color: ColorUtil.textColor),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: SizeUtil.tinySpace,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              S.of(context).overall_time(itemData['time_service']),
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
                              S.of(context).using_date(itemData["time_finish"]),
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
                            text: itemData["total_money"],
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
