import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class GuideTab extends StatelessWidget {
  final dynamic voucher;

  GuideTab({Key key, this.voucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeUtil.midSpace,
          right: SizeUtil.midSmallSpace,
          top: SizeUtil.midSmallSpace),
      child: SingleChildScrollView(
        child: Html(data: voucher['instruction']),
      ),
    );
  }
}
