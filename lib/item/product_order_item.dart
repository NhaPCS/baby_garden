import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/star_display.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';

class ProductOrderItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String skuTitle;
  final int star;
  final String price;
  final String productCount;
  final String subTitle;

  const ProductOrderItem(
      {this.imageUrl,
      this.title,
      this.star,
      this.price,
      this.skuTitle,
      this.productCount,
      this.subTitle})
      : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: SizeUtil.midSmallSpace),
          child: CircleImage(
            borderRadius: 1,
            imageUrl: imageUrl ?? '',
            width: MediaQuery.of(context).size.width / 6,
            height: 50,
          ),
        ),
        SizedBox(
          width: SizeUtil.tinySpace,
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: SizeUtil.smallSpace,
                ),
                MyText(
                  title,
                  style: TextStyle(
                      fontSize: subTitle != null
                          ? SizeUtil.textSizeExpressDetail
                          : SizeUtil.textSizeSmall,
                      fontWeight: subTitle != null
                          ? FontWeight.bold
                          : FontWeight.normal),
                  textAlign: TextAlign.start,
                ),
                subTitle != null
                    ? MyText(
                        StringUtil.removeHtml(subTitle),
                        maxLines: 3,
                        style: TextStyle(
                            height: 1.5, fontSize: SizeUtil.textSizeNoticeTime),
                        textAlign: TextAlign.start,
                      )
                    : SizedBox(
                        height: SizeUtil.tinySpace,
                      ),
                skuTitle != null
                    ? Text(
                        S.of(context).sku_code("123"),
                        style: TextStyle(
                            height: 1.5, fontSize: SizeUtil.textSizeNoticeTime),
                        textAlign: TextAlign.start,
                      )
                    : SizedBox(),
                subTitle != null
                    ? SizedBox()
                    : RichTextForm(
                        title: StringUtil.getPriceText(price) + " X ",
                        titleStyle: TextStyle(
                            height: 1.5,
                            fontSize: SizeUtil.textSizeSmall,
                            color: ColorUtil.textColor,
                            fontWeight: FontWeight.bold),
                        content: productCount,
                        contentStyle: TextStyle(
                          color: ColorUtil.textColor,
                          fontSize: SizeUtil.textSizeSmall,
                        ),
                      ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                star != null
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: StarDisplay(value: star),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
