import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class RatedItem extends StatelessWidget{
  final String shopImg;
  final String itemTitle;
  final String shopName;
  final bool isShowStar;
  final int star;
  final String rateContent;
  final String rateImg;
  final String rateTime;


  const RatedItem({this.shopImg="", this.itemTitle="", this.shopName="", this.isShowStar=false,
      this.star=0, this.rateContent="", this.rateImg="", this.rateTime=""}):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: SizeUtil.smallSpace,
              right: SizeUtil.smallSpace,
              top: SizeUtil.tinySpace),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                  imageUrl: shopImg != ""
                      ? shopImg
                      : StringUtil.dummyImage,
                  width: MediaQuery.of(context).size.width / 6),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        itemTitle,
                        style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: SizeUtil.tinySpace,
                      ),
                      Text(
                        S.of(context).supply_by_supplier(
                            shopName),
                        style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                      ),
                      isShowStar?RatingBar(
                        enable: false,
                        iconColor: ColorUtil.primaryColor,
                        showRateCount: false,
                        isIcon: true,
                        value: star,
                        alignment: MainAxisAlignment.start,
                      ):SizedBox(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        WidgetUtil.getLine(
          margin: EdgeInsets.all(SizeUtil.normalSpace),
          color: ColorUtil.gray,
        ),
        Padding(
          padding: const EdgeInsets.only(left: SizeUtil.normalSpace),
          child: Text(rateContent),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.smallSpace,
                bottom: SizeUtil.smallSpace),
            child: CachedNetworkImage(
                imageUrl: rateImg != ""
                    ? rateImg
                    : StringUtil.dummyImage,
                width: MediaQuery.of(context).size.width / 2)),
        Text(rateTime)
      ],
    );
  }

}