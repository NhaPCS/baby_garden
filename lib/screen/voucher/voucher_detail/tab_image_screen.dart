import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabImageScreen extends StatelessWidget {
  final images = [
    'photo/voucherViettel.png',
    'photo/voucherViettel.png',
    'photo/voucherViettel.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeUtil.smallPadding,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff444444),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: images.map((e) => Image.asset(e)).toList(),
          )
        ],
      ),
    );
  }
}
