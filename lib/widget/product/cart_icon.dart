import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Positioned(
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorUtil.red),
              child: AutoSizeText(
                "1",
                minFontSize: 10,
                maxFontSize: 13,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            right: SizeUtil.tinySpace,
            top: SizeUtil.smallSpace,
          )
        ],
      ),
    );
  }
}
