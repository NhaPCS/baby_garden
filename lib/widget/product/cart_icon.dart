import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (BuildContext context, CartProvider value, Widget child) {
        return GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: SizeUtil.smallPadding,
                child: SvgIcon(
                  'ic_cart.svg',
                  width: 30,
                ),
              ),
              value.badge == 0
                  ? SizedBox()
                  : Positioned(
                      child: Container(
                        width: 18,
                        height: 18,
                        padding: EdgeInsets.all(3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorUtil.red),
                        child: AutoSizeText(
                          value.badge == 0 ? "" : value.badge.toString(),
                          minFontSize: 8,
                          maxFontSize: 13,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      right: SizeUtil.tinySpace,
                      top: SizeUtil.smallSpace,
                    )
            ],
          ),
          onTap: () {
            RouteUtil.pushAndReplaceAll(
                context,
                MainScreen(
                  index: 2,
                ),
                '/main');
          },
        );
      },
    );
  }
}
