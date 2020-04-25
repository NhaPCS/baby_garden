import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageTab extends StatelessWidget {
  final dynamic voucher;

  const ImageTab({Key key, this.voucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyCachedImage(url: voucher['img'],)
      ],
    );
  }
}
