import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/home/widget/notify_me_button.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/loading/rounded_progress.dart';
import 'package:baby_garden_flutter/widget/product/countdown_time.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double height;
  final Color color;
  final double borderRadius;
  final double width;
  final bool showSoldCount;
  final TextStyle nameStyle;
  final bool showTime;
  final int index;
  final dynamic product;
  final bool isPickup;
  final bool isFlashSalePending;
  final VoidCallback onNotifyPress;

  const ProductItem(
      {Key key,
      this.padding = SizeUtil.tinyPadding,
      this.margin = const EdgeInsets.only(
        bottom: SizeUtil.tinySpace,
        left: SizeUtil.superTinySpace,
        right: SizeUtil.superTinySpace,
      ),
      this.height = double.infinity,
      this.color = Colors.white,
      this.borderRadius = 0,
      this.width,
      this.showSoldCount = false,
      this.nameStyle = const TextStyle(
          fontSize: SizeUtil.textSizeSmall, fontWeight: FontWeight.bold),
      this.showTime = false,
      this.index = 0,
      this.product,
      this.isFlashSalePending = false,
      this.isPickup,
      this.onNotifyPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width == null
            ? Provider.of<AppProvider>(context).productWidth
            : width,
        margin: margin,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: padding,
              child: getMainContainer(context),
            ),
            Positioned(
              child: !showTime
                  ? favoriteTag(context)
                  : CountDownTime(
                      startTime: product['time_start'],
                      endTime: product['time_end'],
                    ),
              left: 0,
              top: 0,
            ),
            isFlashSalePending
                ? SizedBox()
                : Positioned(
                    child: DiscountWidget(
                        discount: product == null
                            ? 0
                            : StringUtil.getDiscountPercent(product)),
                    right: 0,
                    top: SizeUtil.smallSpace,
                  ),
            isFlashSalePending
                ? Positioned(
                    child: NotifyMeButton(
                      product: product,
                      onNotifyMePressed: onNotifyPress,
                    ),
                    right: SizeUtil.tinySpace,
                    top: SizeUtil.tinySpace,
                  )
                : SizedBox()
          ],
        ),
      ),
      onTap: () {
        if (isPickup != null && isPickup) {
          Navigator.of(context).pop(product);
        } else
          RouteUtil.push(
              context,
              ProductDetailScreen(
                productId: product['id'],
              ));
      },
    );
  }

  Widget getMainContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Expanded(
            child: CachedNetworkImage(
          imageUrl: product == null ||
                  product['image'] == null ||
                  product['image'].isEmpty
              ? ""
              : product['image'][0],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth,
        )),
        SizedBox(
          height: SizeUtil.tinySpace,
        ),
        MyText(
          product == null ? "" : product['name'],
          maxLines: 2,
          textAlign: TextAlign.center,
          style: nameStyle,
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: AutoSizeText(
              getDiscountPrice(),
              maxFontSize: SizeUtil.textSizeSmall,
              minFontSize: SizeUtil.textSizeTiny,
              maxLines: 1,
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: ColorUtil.textGray),
            )),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            Text(
              product == null
                  ? ""
                  : isFlashSalePending
                      ? product['price_discount']
                      : StringUtil.getPriceText(product['price_discount']),
              style:
                  TextStyle(color: ColorUtil.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        !showSoldCount
            ? SizedBox(
                height: 0,
              )
            : RoundedProgress(
                width: width == null
                    ? Provider.of<AppProvider>(context).productWidth
                    : width,
                height: 18,
                value: isFlashSalePending
                    ? 1
                    : StringUtil.getSalesPercent(
                        product['number_sales'], product['number']),
                label: isFlashSalePending
                    ? S.of(context).will_sell_later
                    : "${product['number_sales']}/${product['number']}",
              ),
        SizedBox(
          height: !showSoldCount ? 0 : SizeUtil.tinySpace,
        )
      ],
    );
  }

  Widget favoriteTag(BuildContext context) {
    return product != null && '1' == product['is_favourite']
        ? Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SvgIcon(
                'bg_favorite.svg',
                width: 75,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.done,
                      color: Colors.white,
                      size: SizeUtil.iconSize,
                    ),
                    SizedBox(
                      width: SizeUtil.tinySpace,
                    ),
                    Text(
                      S.of(context).favorite,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeUtil.textSizeSmall),
                    )
                  ],
                ),
              )
            ],
          )
        : SizedBox(
            width: 0,
            height: 0,
          );
  }

  String getDiscountPrice() {
    if (product == null) return "";
    if (isFlashSalePending) return product['price_discount'];
    return product['price_discount'] != null
        ? StringUtil.getPriceText(product['price_discount'])
        : StringUtil.getPriceText(product['price']);
  }
}
