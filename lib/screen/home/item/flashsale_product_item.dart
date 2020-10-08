import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/home/widget/notify_me_button.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/loading/rounded_progress.dart';
import 'package:baby_garden_flutter/widget/product/countdown_time.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashSaleProductItem extends StatelessWidget {
  final dynamic product;
  final bool isPending;
  final VoidCallback onNotifyMePress;

  const FlashSaleProductItem({Key key, this.product, this.isPending = false, this.onNotifyMePress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic productDetail = product['product_detail']!=null?product['product_detail']: product;
    return Container(
      margin: SizeUtil.tinyPadding,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: SizeUtil.smallPadding,
                child: MyCachedImage(
                  url: product['image'] == null || product['image'].isEmpty
                      ? ""
                      : product['image'][0],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorUtil.lightGray, width: 1)),
              )),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              MyText(
                productDetail['name'],
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: AutoSizeText(
                    StringUtil.getPriceText(productDetail['price']),
                    maxLines: 1,
                    minFontSize: SizeUtil.textSizeMini,
                    maxFontSize: SizeUtil.textSizeSmall,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: ColorUtil.textGray),
                  )),
                  MyText(
                    isPending
                        ? product['price_x']
                        : StringUtil.getPriceText(product['price_discount']),
                    style: TextStyle(
                        color: ColorUtil.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              RoundedProgress(
                width: Provider.of<AppProvider>(context).flashSaleItemWidth,
                height: 18,
                value: isPending
                    ? 1
                    : StringUtil.getSalesPercent(
                        product['number_sales'], product['number']),
                label: isPending
                    ? S.of(context).will_sell_later
                    : S.of(context).sold_count(product['number_sales'],
                        product['number'] == null ? "" : product['number']),
              )
            ],
          ),
          isPending
              ? SizedBox()
              : Positioned(
                  child: DiscountWidget(
                      discount: StringUtil.getDiscountPercent(productDetail)),
                  right: 0,
                  top: 0,
                ),
          Positioned(
            child: CountDownTime(
              startTime: product['time_start'],
              endTime: product['time_end'],
            ),
            left: 0,
            top: -10,
          ),
          isPending
              ? Positioned(
                  child: NotifyMeButton(
                    product: product,
                    onNotifyMePressed: onNotifyMePress,
                  ),
                  right: SizeUtil.tinySpace,
                  top: SizeUtil.tinySpace,
                )
              : SizedBox()
        ],
      ),
      width: Provider.of<AppProvider>(context).flashSaleItemWidth,
    );
  }
}
