import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_added_promo.dart';
import 'package:baby_garden_flutter/item/item_product_cart.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends BaseState<CartScreen> {
  final TextEditingController _promoCodeController = TextEditingController();
  int count = 3;

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        getAppBar(title: S.of(context).cart.toUpperCase(), hasBack: false),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: count,
                itemBuilder: (context, index) {
                  if (index == count - 1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WidgetUtil.paddingWidget(Text(
                          S.of(context).type_promo_code,
                          style: TextStyle(
                              color: ColorUtil.primaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                        WidgetUtil.paddingWidget(Row(
                          children: <Widget>[
                            Expanded(
                                child: MyTextField(
                              textEditingController: _promoCodeController,
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
                                  //TODO
                                },
                                text: S.of(context).apply,
                                color: ColorUtil.primaryColor,
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                borderRadius: SizeUtil.tinyRadius)
                          ],
                        )),
                        ItemAddedPromo(),
                        ItemAddedPromo(),
                        WidgetUtil.getLine(width: 2, margin: EdgeInsets.all(0)),
                        WidgetUtil.paddingWidget(
                            Row(
                              children: <Widget>[
                                Expanded(child: Text(S.of(context).pre_count)),
                                Text("640.000 đ")
                              ],
                            ),
                            padding: SizeUtil.smallPadding),
                        WidgetUtil.getLine(margin: EdgeInsets.all(0)),
                        WidgetUtil.paddingWidget(
                            Row(
                              children: <Widget>[
                                Expanded(child: Text(S.of(context).promo_code)),
                                Text(
                                  "-640.000 đ",
                                  style: TextStyle(color: ColorUtil.blueLight),
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
                              //TODO
                            },
                            text: S.of(context).take_order.toUpperCase(),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            color: ColorUtil.primaryColor,
                            padding: SizeUtil.smallPadding,
                          ),
                        )
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleCheckbox(
                        text: Text(
                          "Vườn Của Bé",
                          style: TextStyle(
                              color: ColorUtil.textGray,
                              fontWeight: FontWeight.bold),
                        ),
                        checkBg: Icons.radio_button_checked,
                        uncheckBg: Icons.radio_button_unchecked,
                        color: ColorUtil.primaryColor,
                        activeColor: ColorUtil.primaryColor,
                      ),
                      WidgetUtil.getLine(
                          margin: EdgeInsets.only(
                              top: 0, bottom: SizeUtil.smallSpace)),
                      ItemProductCart(),
                      ItemProductCart(
                        hasDashLine: false,
                      ),
                      WidgetUtil.getLine(margin: EdgeInsets.all(0), width: 5)
                    ],
                  );
                }))
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
