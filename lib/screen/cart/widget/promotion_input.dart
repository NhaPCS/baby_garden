import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/added_promo_item.dart';
import 'package:baby_garden_flutter/screen/cart/provider/get_promotion_detail_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PromotionInput extends StatelessWidget {
  final TextEditingController promoCodeController;
  final String price;
  final VoidCallback onGoBookingPress;
  final VoidCallback onApplyCodePress;
  final VoidCallback onRemoveCodePress;

  const PromotionInput(
      {Key key,
      this.promoCodeController,
      this.price,
      this.onGoBookingPress,
      this.onApplyCodePress,
      this.onRemoveCodePress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        WidgetUtil.paddingWidget(Text(
          S.of(context).type_promo_code,
          style: TextStyle(
              color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
        )),
        WidgetUtil.paddingWidget(Row(
          children: <Widget>[
            Expanded(
                child: MyTextField(
              textEditingController: promoCodeController,
              borderColor: ColorUtil.textGray,
              borderRadius: SizeUtil.tinyRadius,
              hint: S.of(context).promo_code,
              hintStyle: TextStyle(color: ColorUtil.textHint),
            )),
            SizedBox(
              width: SizeUtil.defaultSpace,
            ),
            MyRaisedButton(
                onPressed: () {
                  onApplyCodePress();
                },
                text: S.of(context).apply,
                color: ColorUtil.primaryColor,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                borderRadius: SizeUtil.tinyRadius)
          ],
        )),
        Consumer<GetPromotionDetailProvider>(
          builder: (BuildContext context, GetPromotionDetailProvider value,
              Widget child) {
            if (value.promotion == null) return SizedBox();
            return AddedPromoItem(
              promotion: value.promotion,
              onRemoved: () {
                onRemoveCodePress();
              },
            );
          },
        ),
        WidgetUtil.getLine(width: 2, margin: EdgeInsets.all(0)),
        WidgetUtil.paddingWidget(
            Row(
              children: <Widget>[
                Expanded(child: Text(S.of(context).pre_count)),
                Text(StringUtil.getPriceText(price))
              ],
            ),
            padding: SizeUtil.smallPadding),
        WidgetUtil.getLine(margin: EdgeInsets.all(0)),
        WidgetUtil.paddingWidget(
            Row(
              children: <Widget>[
                Expanded(child: Text(S.of(context).promo_code)),
                Consumer<GetPromotionDetailProvider>(
                  builder: (BuildContext context,
                      GetPromotionDetailProvider value, Widget child) {
                    return MyText(
                      value.promotion == null
                          ? ''
                          : "-${StringUtil.getPriceText(value.promotion['value'])}",
                      style: TextStyle(color: ColorUtil.blueLight),
                    );
                  },
                )
              ],
            ),
            padding: SizeUtil.smallPadding),
        WidgetUtil.getLine(width: 5, margin: EdgeInsets.all(0)),
        Container(
          padding: SizeUtil.defaultPadding,
          width: double.infinity,
          child: MyRaisedButton(
            onPressed: () {
              onGoBookingPress();
            },
            text: S.of(context).take_order.toUpperCase(),
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            color: ColorUtil.primaryColor,
            padding: SizeUtil.smallPadding,
          ),
        )
      ],
    );
  }
}
