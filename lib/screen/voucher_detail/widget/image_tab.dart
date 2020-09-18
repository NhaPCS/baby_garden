import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageTab extends StatelessWidget {
  final dynamic voucher;

  const ImageTab({Key key, this.voucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: voucher['img'] == null ? 0 : voucher['img'].length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: SizeUtil.defaultSpace),
          child: MyCachedImage(
            url: voucher['img'][index],
          ),
        );
      },
    );
  }
}
