import 'dart:math';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class SearchHistoryItem extends StatelessWidget {
  final ValueChanged<String> onSearchItemPress;
  final dynamic history;

  const SearchHistoryItem({Key key, this.onSearchItemPress, this.history})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: SizeUtil.smallPadding,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorUtil.lightGray))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MyText(history['title']),
            ),
            Transform.rotate(
              angle: -180 * pi / 360,
              alignment: Alignment.center,
              child: Icon(
                Icons.call_made,
                color: ColorUtil.gray,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        onSearchItemPress(history['title']);
      },
    );
  }
}
