import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ItemBigCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: SizeUtil.smallPadding,
      child: Image.asset('photo/ic_toy.png'),
    );
  }
}
