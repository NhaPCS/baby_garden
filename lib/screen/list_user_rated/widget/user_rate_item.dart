import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRatedItem extends StatelessWidget {
  final dynamic comment;

  const UserRatedItem({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> imgs = comment['image'];
    return Container(
      margin: EdgeInsets.only(
          left: SizeUtil.midSmallSpace,
          right: SizeUtil.midSmallSpace,
          top: SizeUtil.superTinySpace,
          bottom: SizeUtil.superTinySpace),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeUtil.tinyRadius),
          ),
          side: BorderSide(
            color: ColorUtil.lineColor,
            width: 0.3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(SizeUtil.midSmallSpace),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleImage(
                imageUrl: comment['user_avatar'] ?? '',
                width: 45,
                height: 45,
              ),
              SizedBox(
                width: SizeUtil.tinySpace,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    comment['user_name'] ?? '',
                    style: TextStyle(
                        color: ColorUtil.black33, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  RatingBar(
                    enable: false,
                    iconColor: ColorUtil.primaryColor,
                    showRateCount: false,
                    isIcon: true,
                    value: int.parse(comment['star'] ?? '0'),
                    alignment: MainAxisAlignment.start,
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    comment['content'] ?? '',
                    style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  imgs != null && imgs.isNotEmpty
                      ? SingleChildScrollView(
                          child: Row(
                            children: imgs.map((img) {
                              return Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: MyCachedImage(
                                  url: img,
                                  width: 100,
                                  height: 70,
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(comment['date'] ?? '',
                      style: TextStyle(fontSize: SizeUtil.textSizeSmall))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
