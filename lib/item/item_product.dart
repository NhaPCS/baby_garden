import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/rounded_progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemProduct extends StatelessWidget {
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

  const ItemProduct(
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
      this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width == null
            ? Provider.of<AppProvider>(context).productWidth
            : width,
        padding: padding,
        margin: margin,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: Stack(
          children: <Widget>[
            getMainContainer(context),
            !showTime
                ? SizedBox()
                : MyRaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace,
                        top: SizeUtil.tinySpace,
                        bottom: SizeUtil.tinySpace),
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: SizeUtil.textSizeSmall),
                    text: "00:56:23",
                    borderRadius: SizeUtil.bigRadius,
                  ),
            Positioned(
              child: DiscountWidget(discount: 33),
              right: 0,
              top: SizeUtil.smallSpace,
            )
          ],
        ),
      ),
      onTap: () {
        RouteUtil.push(context, ProductDetailScreen());
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
          imageUrl:
              StringUtil.dummyProduct[index % StringUtil.dummyProduct.length],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth,
        )),
        SizedBox(
          height: SizeUtil.tinySpace,
        ),
        Text(
          "Điện Thoại iPhone 11 Pro Max 64GB\n - Hàng Chính Hãng",
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
              "800.000 đ",
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
              "800.000 đ",
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
                value: 0.4,
                label: S.of(context).sold_count("100", "200"),
              ),
        SizedBox(
          height: !showSoldCount ? 0 : SizeUtil.tinySpace,
        )
      ],
    );
  }
}
