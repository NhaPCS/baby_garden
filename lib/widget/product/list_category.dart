import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  final double categoryWidth;
  final double categoryHeight;

  const ListCategory(
      {Key key, @required this.categoryWidth, @required this.categoryHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lineColor,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: categoryWidth,
            padding: SizeUtil.tinyPadding,
            margin: EdgeInsets.only(
                top: SizeUtil.smallSpace,
                bottom: SizeUtil.smallSpace,
                left: SizeUtil.tinySpace,
                right: SizeUtil.tinySpace),
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  index == 0 ? 'photo/ic_all.png' : 'photo/ic_phone.png',
                  width: SizeUtil.iconSizeBigger,
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                AutoSizeText(
                  index == 0 ? S.of(context).all : "Điện thoại & phụ kiện",
                  maxLines: 2,
                  maxFontSize: SizeUtil.textSizeTiny,
                  minFontSize: SizeUtil.textSizeMini,
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
      height: categoryHeight,
    );
  }
}
