import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/booking_screen.dart';
import 'package:baby_garden_flutter/screen/cart/provider/get_promotion_detail_provider.dart';
import 'package:baby_garden_flutter/screen/cart/widget/product_by_shop.dart';
import 'package:baby_garden_flutter/screen/cart/widget/promotion_input.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
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
  final GetPromotionDetailProvider _getPromotionDetailProvider =
      GetPromotionDetailProvider();

  @override
  void initState() {
    super.initState();
  }

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
                    return PromotionInput(
                      promoCodeController: _promoCodeController,
                      getPromotionDetailProvider: _getPromotionDetailProvider,
                      onApplyCodePress: () {
                        if (_promoCodeController.text.isNotEmpty)
                          _getPromotionDetailProvider.getPromotionDetail(
                              _promoCodeController.text,
                              value.selectedShop['shop_id']);
                      },
                      onRemoveCodePress: (id) {
                        _getPromotionDetailProvider.clearPromotion(id);
                      },
                      onGoBookingPress: () {
                        if (value.selectedShop != null)
                          push(BookingScreen(
                            promotions: _getPromotionDetailProvider.promotions,
                            shopID: value.selectedShop['shop_id'],
                            shopName: value.selectedShop['shop_name'],
                          ));
                      },
                      price: value.price.toString(),
                    );
                  }
                  return ProductByShop(
                    isSelected: value.selectedShop != null &&
                        value.selectedShop['shop_id'] ==
                            value.shops[index]['shop_id'],
                    shop: value.shops[index],
                    onSelectShop: (s) {
                      if (s) {
                        Provider.of<CartProvider>(context, listen: false)
                            .updateSelectedShop(value.shops[index]);
                      }
                    },
                  );
                });
          },
        ))
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _getPromotionDetailProvider),
    ];
  }
}
