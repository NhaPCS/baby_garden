import 'dart:ui';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final double productWidth;
  final double productHeight;

  const ListProduct(
      {Key key, @required this.productWidth, @required this.productHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lineColor,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: productWidth,
            padding: SizeUtil.tinyPadding,
            margin: EdgeInsets.only(
                bottom: SizeUtil.smallSpace,
                left: SizeUtil.tinySpace,
                right: SizeUtil.tinySpace),
            height: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Image.asset(
                  'photo/ic_phone.png',
                )),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Text(
                  "Điện Thoại iPhone 11 Pro Max 64GB - Hàng Chính Hãng",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                  ),
                )
              ],
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
      height: productHeight,
    );
  }
}
