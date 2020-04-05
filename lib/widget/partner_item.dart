import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerItem extends StatelessWidget {
  final dynamic shop;

  const PartnerItem({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: MyCachedImage(
                url: shop['img'],
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
                      value: shop['star'] == null ? 0 : int.parse(shop['star']),
                      enable: false,
                      isIcon: true,
                      showRateCount: false,
                      iconColor: ColorUtil.yellowPartnerStarColor,
                    ),
                    SizedBox(
                      width: SizeUtil.tinySpace,
                    ),
                    MyText(
                      shop['star'],
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
                          MyText(
                            shop['service'],
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeBigger,
                                color: ColorUtil.yellowPartnerColor,
                                fontWeight: FontWeight.bold),
                          ),
                          MyText(
                            shop['address'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            shop['introduce'],
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
                            MyText(
                              shop['number_like'],
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
                            MyText(
                              shop['number_comment'],
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
