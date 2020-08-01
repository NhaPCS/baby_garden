import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRatedItem extends StatelessWidget {
  final dynamic comment;

  const UserRatedItem({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              CircleAvatar(
                backgroundImage: ExactAssetImage("photo/child_avatar.png"),
              ),
              SizedBox(
                width: SizeUtil.tinySpace,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Trần Đỗ Minh Ân",
                    style: TextStyle(
                        color: ColorUtil.black33, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  RatingBar(
                    enable: false,
                    iconColor: ColorUtil.primaryColor,
                    showRateCount: true,
                    isIcon: true,
                    value: 4,
                    rateCount: 4,
                    alignment: MainAxisAlignment.start,
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    "- Những sản phẩm Vườn Của Bé thật tuyệt vời",
                    style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "photo/saling_detail_img.png.png",
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width * 2 / 9,
                      ),
                      SizedBox(
                        width: SizeUtil.smallSpace,
                      ),
                      Image.asset(
                        "photo/saling_detail_img.png.png",
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width * 2 / 9,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text("26/12/2019 15:10 I Áo len dạ nỉ bé gái 12 tuổi",
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
