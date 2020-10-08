import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/list_user_rated_screen.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/see_more_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/shop_icon_info.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'favorite_shop_button.dart';
import 'shop_info_form.dart';

class ShopInfoHeader extends StatelessWidget {
  final dynamic shop;
  final SeeMoreProvider seeMoreProvider;
  final VoidCallback onFavoritePressed;
  final bool isShow;

  const ShopInfoHeader(
      {Key key,
      this.shop,
      this.seeMoreProvider,
      this.onFavoritePressed,
      this.isShow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shop == null) return SizedBox();
    String introduce = shop['introduce'];
    bool isShowSeeMore = introduce != null && introduce.length > 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: shop['img'] ?? '',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: SizeUtil.smallSpace,
              right: SizeUtil.smallSpace,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShopIconInfo(
                    icon: "photo/comment_img.png",
                    textData: shop['number_comment'] ?? '',
                    onTap: () {
                      RouteUtil.push(
                          context,
                          ListUserRatedScreen(
                            shopId: shop['id'],
                          ));
                    },
                  ),
                  SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
                  ShopIconInfo(
                    onTap: onFavoritePressed,
                    iconWidget: Icon(
                      Icons.favorite,
                      color: shop['is_favourite'] == '0'
                          ? ColorUtil.gray
                          : ColorUtil.red,
                      size: SizeUtil.iconSize,
                    ),
                    textData: shop['number_like'] ?? '0',
                  ),
                ],
              ),
            )
          ],
        ),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: InkWell(
              child: ShopInfoForm(
                title: S.of(context).mobilePhone_form,
                content: shop["phone"] ?? '',
                contentColor: ColorUtil.blueLight,
              ),
              onTap: () async {
                String uri = "tel:${shop["phone"]}";
                if (await canLaunch(uri)) launch(uri);
              },
            )),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            FavoriteShopButton(
              isFavorite:
                  shop['is_favourite'] != null && shop['is_favourite'] == '1',
            )
          ],
        )),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ShopInfoForm(
                    title: S.of(context).address_form,
                    content: StringUtil.getFullAddress(shop,
                        hasPersonalData: false))),
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            InkWell(
              onTap: () async {
                String uri =
                    "https://www.google.com/maps/search/?api=1&query=${Uri.encodeFull(shop['lat'])},${Uri.encodeFull(shop['lng'])}";
                if (await canLaunch(uri)) launch(uri);
              },
              child: Text(
                S.of(context).direction,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    color: ColorUtil.blueLight),
              ),
            ),
          ],
        )),
        paddingContainer(ShopInfoForm(
          title: S.of(context).service_type,
          content: shop['category_name'] ?? '',
          contentColor: ColorUtil.blueLight,
        )),
        paddingContainer(RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              text: S.of(context).introduce,
              style: TextStyle(
                  color: ColorUtil.textColor, fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: isShowSeeMore && !isShow
                        ? introduce.substring(0, 100)
                        : introduce,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeExpressDetail,
                        color: ColorUtil.textColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {seeMoreProvider.onChange()}),
                TextSpan(
                  text: isShowSeeMore && !isShow ? S.of(context).see_more : "",
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      color: ColorUtil.blueLight,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {seeMoreProvider.onChange()},
                ),
              ]),
        )),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
      ],
    );
  }

  Widget paddingContainer(Widget widget,
      {EdgeInsets padding = const EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace)}) {
    return Padding(
      padding: padding,
      child: widget,
    );
  }
}
