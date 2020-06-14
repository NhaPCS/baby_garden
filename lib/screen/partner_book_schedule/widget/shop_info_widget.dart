import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/shop_icon_info.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/shop_info_form.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'favorite_shop_button.dart';

//class ShopInfoWidget extends StatelessWidget {
//  final dynamic shop;
//
//  const ShopInfoWidget({Key key, this.shop}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    if (shop == null) return SizedBox();
//    return Column(
//      children: <Widget>[
//        Stack(
//          children: <Widget>[
//            MyCachedImage(
//              url: shop['img'],
//              height: 151,
//              boxFit: BoxFit.fitWidth,
//            ),
//            Positioned(
//              bottom: SizeUtil.smallSpace,
//              right: SizeUtil.smallSpace,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  ShopIconInfo(
//                    icon: "photo/comment_img.png",
//                    textData: shop['number_comment'],
//                  ),
//                  SizedBox(
//                    width: SizeUtil.smallSpace,
//                  ),
//                  ShopIconInfo(
//                    icon: "photo/heart.png",
//                    textData: shop['number_like'],
//                  )
//                ],
//              ),
//            )
//          ],
//        ),
//        //todo shop info
//        shopInfo(context, value.isShow),
//        SizedBox(
//          height: SizeUtil.tinySpace,
//        ),
//      ],
//    );
//  }
//
//  Widget shopInfo(BuildContext context, bool isShow) {
//    if (shop == null) {
//      return Container(height: 0);
//    }
//    final ValueNotifier<bool> isFavorite =
//        ValueNotifier(shop['is_favourite'] == "1");
//    String content = shop['introduce'];
//    bool isShowSeeMore = content != null && content.length > 100;
//    return Padding(
//      padding: EdgeInsets.only(
//          left: SizeUtil.smallSpace,
//          right: SizeUtil.smallSpace,
//          top: SizeUtil.tinySpace),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Row(
//            crossAxisAlignment: CrossAxisAlignment.end,
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              InkWell(
//                child: ShopInfoForm(
//                  title: S.of(context).mobilePhone_form,
//                  content: shop["phone"],
//                  contentColor: ColorUtil.blueLight,
//                ),
//                onTap: () async {
//                  String uri = "tel:${shop["phone"]}";
//                  if (await canLaunch(uri)) launch(uri);
//                },
//              ),
//              SizedBox(
//                width: SizeUtil.tinySpace,
//              ),
//              //todo like button
//              FavoriteShopButton(
//                isFavorite: isFavorite,
//                shopId: shop['id'],
//              )
//            ],
//          ),
//          Row(
//            crossAxisAlignment: CrossAxisAlignment.end,
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              ShopInfoForm(
//                  title: S.of(context).address_form,
//                  content: getAddress()),
//              SizedBox(
//                width: SizeUtil.smallSpace,
//              ),
//              InkWell(
//                onTap: () async {
//                  String address =getAddress();
//                  String uri =
//                      "https://www.google.com/maps/search/${Uri.encodeFull(address)}";
//                  if (address != null && address.isNotEmpty && await canLaunch(uri)) launch(uri);
//                },
//                child: Text(
//                  S.of(context).direct_address,
//                  style: TextStyle(
//                      fontSize: SizeUtil.textSizeSmall,
//                      color: ColorUtil.blueLight),
//                ),
//              ),
//            ],
//          ),
//          ShopInfoForm(
//            isExpanded: false,
//            title: S.of(context).service_type,
//            content: shop['category_id'],
//            contentColor: ColorUtil.blueLight,
//          ),
//          RichText(
//            textAlign: TextAlign.start,
//            text: TextSpan(
//                text: S.of(context).introduce,
//                style: TextStyle(
//                    color: ColorUtil.textColor, fontWeight: FontWeight.bold),
//                children: <TextSpan>[
//                  TextSpan(
//                      text: isShowSeeMore && !isShow
//                          ? content.substring(0, 100)
//                          : content,
//                      style: TextStyle(
//                          fontSize: SizeUtil.textSizeExpressDetail,
//                          color: ColorUtil.textColor,
//                          decoration: TextDecoration.none,
//                          fontWeight: FontWeight.normal),
//                      recognizer: TapGestureRecognizer()
//                        ..onTap = () => {_seeMoreProvider.onChange()}),
//                  TextSpan(
//                    text:
//                        isShowSeeMore && !isShow ? S.of(context).see_more : "",
//                    style: TextStyle(
//                        fontSize: SizeUtil.textSizeSmall,
//                        color: ColorUtil.blueLight,
//                        decoration: TextDecoration.none,
//                        fontWeight: FontWeight.normal),
//                    recognizer: TapGestureRecognizer()
//                      ..onTap = () => {_seeMoreProvider.onChange()},
//                  ),
//                ]),
//          ),
//        ],
//      ),
//    );
//  }
//
//  String getAddress() {
//    return shop['address'] != null && shop['address'].length > 0
//        ? shop['address'][0]["address"]
//        : "";
//  }
//}
