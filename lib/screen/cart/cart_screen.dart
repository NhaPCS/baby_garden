import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
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
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();

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
            return Consumer<ChangeIndexProvider>(
              builder: (BuildContext context,
                  ChangeIndexProvider changeIndexProvider, Widget child) {
                return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: value.shops.length + 1,
                    itemBuilder: (context, index) {
                      if (index == value.shops.length) {
                        return PromotionInput(
                          promoCodeController: _promoCodeController,
                          onApplyCodePress: () {
                            if (_promoCodeController.text.isNotEmpty)
                              _getPromotionDetailProvider.getPromotionDetail(
                                  _promoCodeController.text);
                          },
                          onRemoveCodePress: () {
                            _getPromotionDetailProvider.clearPromotion();
                          },
                          onGoBookingPress: () {
                            if (_changeIndexProvider.index >= 0)
                              push(BookingScreen(
                                promoteCode:
                                    _getPromotionDetailProvider.promotion ==
                                            null
                                        ? null
                                        : _getPromotionDetailProvider
                                            .promotion['code'],
                                shopID: value.shops[_changeIndexProvider.index]
                                    ['shop_id'],
                              ));
                          },
                          price: value.price.toString(),
                        );
                      }
                      return ProductByShop(
                        isSelected: _changeIndexProvider.index == index,
                        shop: value.shops[index],
                        onSelectShop: (s) {
                          if (s) _changeIndexProvider.changeIndex(index);
                        },
                      );
                    });
              },
            );
          },
        ))
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _changeIndexProvider),
      ChangeNotifierProvider.value(value: _getPromotionDetailProvider),
    ];
  }
}
