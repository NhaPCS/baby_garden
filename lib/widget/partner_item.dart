import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerItem extends StatelessWidget {
  PartnerItem();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        elevation: 2,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                "photo/partner_item_img.png",
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: SizeUtil.normalSpace,
                    right: SizeUtil.normalSpace,
                    top: SizeUtil.tinySpace,
                    bottom: SizeUtil.tinySpace),
                decoration: BoxDecoration(
                    color: Color(0xff000000).withOpacity(0.5),
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
                child: Row(
                  children: <Widget>[
                    RatingBar(
                      starSize: SizeUtil.iconSize,
                      value: 4,
                      enable: false,
                      isIcon: true,
                      showRateCount: false,
                      iconColor: ColorUtil.yellowPartnerStarColor,
                    ),
                    SizedBox(
                      width: SizeUtil.tinySpace,
                    ),
                    Text(
                      "4.0",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeTiny, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.biggerSpace,
                    top: SizeUtil.tinySpace,
                    bottom: SizeUtil.tinySpace),
                decoration: BoxDecoration(
                    color: Color(0xff000000).withOpacity(0.5),
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "30 SHINE",
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeBigger,
                                color: ColorUtil.yellowPartnerColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "367 Nguyễn Đình Chiểu, Quận 3 , TP.HCM",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(height: 2,),
                          Text(
                            "Cắt tóc đẹp trai!",
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Image.asset(
                              "photo/heart.png",
                              width: SizeUtil.iconSizeBigger,
                              height: SizeUtil.iconSizeBigger,
                            ),
                            SizedBox(
                              width: SizeUtil.tinySpace,
                            ),
                            Text(
                              "234",
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeDefault,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeUtil.tinySpace,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Image.asset(
                              "photo/comment_img.png",
                              width: SizeUtil.iconSizeBigger,
                              height: SizeUtil.iconSizeBigger,
                            ),
                            SizedBox(
                              width: SizeUtil.tinySpace,
                            ),
                            Text(
                              "12",
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeDefault,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
