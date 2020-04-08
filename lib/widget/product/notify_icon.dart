import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/screen/notify/notify_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: SizeUtil.smallPadding,
            child: SvgIcon(
              'ic_bell.svg',
              height: 24,
            ),
          ),
          Positioned(
            child: Container(
              width: 16,
              height: 16,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorUtil.red),
              child: AutoSizeText(
                "1",
                minFontSize: 9,
                maxFontSize: 12,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            right: SizeUtil.tinySpace,
            top: SizeUtil.tinySpace,
          )
        ],
      ),
      onTap: () {
        RouteUtil.push(context, NotifyScreen());
      },
    );
  }
}
