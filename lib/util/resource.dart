import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorUtil {
  static const Color primaryColor = Color(0xffFF8918);
  static const Color colorAccent = Color(0xffFFB00B);
  static const Color textColor = Color(0xff40433F);
  static const Color textGray = Color(0xff808080);
  static const Color textHint = Color(0xff646464);
  static const Color black33 = Color(0xff333333);
  static const Color green = Color(0xff13BE2A);
  static const Color red = Color(0xffFF0000);
  static const Color blue = Color(0xff047194);
  static const Color gray = Color(0xffA8A8A8);
  static const Color lightGray = Color(0xffEFEFEF);
  static const Color lineColor = Color(0xffF4F4F4);
  static const Color flashSaleColor = Color(0xffF77102);
  static const Color bgProgressOrange = Color(0xffFFB483);

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}

class StringUtil {
  static const String dummyImage =
      "https://imgix.bustle.com/uploads/image/2019/1/23/4ca31ad3-6f9b-4e75-a0bf-fada7bfecfae-shutterstock_10068471c.jpg?w=970&h=546&fit=crop&crop=faces&auto=format&q=70&dpr=2";
}

class SizeUtil {
  static const EdgeInsets defaultPadding = EdgeInsets.all(20);
  static const EdgeInsets bigPadding = EdgeInsets.all(30);
  static const EdgeInsets hugePadding = EdgeInsets.all(40);
  static const EdgeInsets smallPadding = EdgeInsets.all(10);
  static const EdgeInsets tinyPadding = EdgeInsets.all(5);
  static const EdgeInsets normalPadding = EdgeInsets.all(15);

  static const double defaultSpace = 20;
  static const double normalSpace = 15;
  static const double smallSpace = 10;
  static const double tinySpace = 5;
  static const double bigSpace = 30;
  static const double hugSpace = 50;
  static const double largeSpace = 70;
  static const double biggerSpace = 40;

  static const double textSizeBig = 24;
  static const double textSizeItemPost = 30;
  static const double textSizeBigger = 17;
  static const double textSizeDefault = 15;
  static const double textSizeSmall = 11;
  static const double textSizeTiny = 8;
  static const double textSizeMini = 5;
  static const double textSizeHuge = 40;

  static const double iconSize = 15;
  static const double iconSizeBigger = 25;
  static const double iconSizeBig = 35;

  static const double smallRadius = 10;
  static const double bigRadius = 15;
  static const double tinyRadius = 5;

  static const double defaultElevation = 5;

  static const double lineHeight = 5;
}

class WidgetUtil {
  static Widget getInputRow(String title, TextEditingController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: ColorUtil.textColor),
        ),
        Expanded(
          child: TextField(
              controller: controller,
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    top: SizeUtil.defaultSpace,
                    bottom: SizeUtil.tinySpace),
                hasFloatingPlaceholder: false,
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorUtil.textColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorUtil.textColor)),
                hoverColor: ColorUtil.textColor,
              )),
        )
      ],
    );
  }

  static showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(ColorUtil.blue),
            ),
          );
        });
  }

  static Widget getLine({EdgeInsetsGeometry margin}) {
    return Container(
      height: 1,
      color: ColorUtil.textGray,
      margin: margin,
    );
  }

  static void showErrorDialog(BuildContext context, String message,
      {VoidCallback onOkClick}) {
    if (message == null || message.isEmpty) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new CupertinoAlertDialog(
            title: Text("Error"),
            content: Padding(
              padding: EdgeInsets.only(top: SizeUtil.smallSpace),
              child: new Text(message),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  if (onOkClick != null) onOkClick();
                },
              ),
            ],
          );
        });
  }

  static void showMessageDialog(BuildContext context,
      {@required String message,
      @required String title,
      VoidCallback onOkClick}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new CupertinoAlertDialog(
        title: Text(title),
        content: Padding(
          padding: EdgeInsets.only(top: SizeUtil.smallSpace),
          child: new Text(message),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
              if (onOkClick != null) onOkClick();
            },
          ),
        ],
      ),
    );
  }

  static void showConfirmDialog(BuildContext context,
      {String message,
      String title,
      String positive = "OK",
      String negative = "Camcel",
      VoidCallback positiveClicked,
      VoidCallback negativeClick}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new CupertinoAlertDialog(
        title: Text(title),
        content: Padding(
          padding: EdgeInsets.only(top: SizeUtil.smallSpace),
          child: new Text(message),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(positive),
            onPressed: () {
              Navigator.of(context).pop();
              if (positiveClicked != null) positiveClicked();
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(negative),
            onPressed: () {
              Navigator.of(context).pop();
              if (negativeClick != null) negativeClick();
            },
          ),
        ],
      ),
    );
  }
}
