import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_added_promo.dart';
import 'package:baby_garden_flutter/item/item_product_cart.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/booking_screen.dart';
import 'package:baby_garden_flutter/screen/cart/product_by_shop.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final VoidCallback onGoHome;

  const CartScreen({Key key, this.onGoHome}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends BaseState<CartScreen> {
  final TextEditingController _promoCodeController = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        getAppBar(title: S.of(context).cart.toUpperCase(), hasBack: false),
        Expanded(child: Consumer<CartProvider>(
          builder: (BuildContext context, CartProvider value, Widget child) {
            if (value.shops == null || value.shops.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    S.of(context).no_product_in_cart,
                    textAlign: TextAlign.center,
                  ),
                  MyRaisedButton(
                      onPressed: () {
                        widget.onGoHome();
                      },
                      text: S.of(context).go_shopping,
                      textStyle: TextStyle(color: Colors.white),
                      color: ColorUtil.primaryColor)
                ],
              );
            }
            return ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: value.shops.length + 1,
                itemBuilder: (context, index) {
                  if (index == value.shops.length) {
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
                                Text(StringUtil.getPriceText(value.price.toString()))
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
                              push(BookingScreen(shopID: value.shops.values.toList()[0],promoteCode: "promoteCode here",));
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
                  return ProductByShop(
                    shop: value.shops.values.toList()[index],
                  );
                });
          },
        ))
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
