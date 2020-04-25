import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/shop_icon_info.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerItem extends StatelessWidget {
  final dynamic shop;

  const PartnerItem({this.shop}) : super();

  @override
  Widget build(BuildContext context) {
    if (shop == null) return SizedBox();
    return Card(
        elevation: 2,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              // TODO không dùng card shape border vì k clip dc ảnh
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
                    color: Colors.black.withOpacity(0.5),
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
                    color: Colors.black.withOpacity(0.5),
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
                        ShopIconInfo(
                          icon: "photo/heart.png",
                          textData: shop['number_like'],
                          bgColor: ColorUtil.white,
                          isPadding: false,
                          iconSize: SizeUtil.iconSizeBigger,
                          textSize: SizeUtil.textSizeDefault,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: SizeUtil.tinySpace,
                        ),
                        ShopIconInfo(
                          icon: "photo/comment_img.png",
                          textData: shop['number_comment'],
                          bgColor: ColorUtil.white,
                          isPadding: false,
                          iconSize: SizeUtil.iconSizeBigger,
                          textSize: SizeUtil.textSizeDefault,
                          textColor: Colors.white,
                        ),
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
