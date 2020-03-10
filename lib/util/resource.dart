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
  static const Color blueLight = Color(0xff00AAE9);
  static const Color gray = Color(0xffA8A8A8);
  static const Color lightGray = Color(0xffEFEFEF);
  static const Color lineColor = Color(0xffE9E9E9);
  static const Color indicatorActiveColor = Color(0xffE4EB18);
  static const Color yellowPartnerColor = Color(0xffFBC900);
  static const Color yellowPartnerStarColor = Color(0xffEBF308);
  static const Color indicatorUnactiveColor = Color(0xffB0B1A1);
  static const Color blueForgotPass = Color(0xff2294AB);
  static const Color flashSaleColor = Color(0xffF77102);
  static const Color bgProgressOrange = Color(0xffFFB483);
  static const Color white = Color(0xffffff);
  static const Color logoBgColor = Color(0xffE1F2F9);
  static const Color transGray = Color(0x66EFEFEF);
  static const Color grayLine = Color(0xff646464);
  static const Color customerSupportUpdate = Color(0xff73EBD5);


  static const serviceItemUnselectColor = Color(0xffF6F6F6);

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
  static const List<String> dummyImageList = [
    "https://static.topshop.com/v1/static/json-0000156327_TSHP_WK25_THURSDAY_DESKTOP_UK_01jpg",
    "https://fashioninthecity.com/wp-content/uploads/2018/12/GENDER-NEUTRAL-BANNER-FINAL.jpg",
    "https://r8zlusvr.rocketcdn.com/templates/selectfashion.co.uk.new/assets/images/home/main-page-pods/pod2-newin2.jpg",
    "https://www.telegraph.co.uk/content/dam/fashion/2019/11/26/LKB_AW19_AUGUST_10_trans_NvBQzQNjv4BqXxNHKgVzGLlMTFfSc8ogRjgvSsGPs1UGfa2r2ifahVI.jpg?imwidth=450"
  ];
  static const List<String> dummyProduct = [
    'https://m2.ikea.cn/cn/en/images/products/leka-baby-gym__0757034_PE749099_S5.JPG?f=s',
    'https://cdn.cheapism.com/images/090517_dangerous_baby_products_sl.2e16d0ba.fill-1440x605.jpg',
    'https://auto.ndtvimg.com/bike-images/big/yamaha/r15-v30/yamaha-r15-v30.jpg?v=16',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone8-gold-select-2018?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1550795416637',
    'https://media.4rgos.it/i/Argos/8615002_R_Z001A_UC887197?w=750&h=440&qlt=70',
    'https://www.thespruceeats.com/thmb/ecUy27FyEII2nwF4HWNe5Yoi6Xk=/2667x2667/smart/filters:no_upscale()/PanSobaoBread-019-Done-f0ac98a6918c43aca4dd7f03b0ffcf96.jpg',
    'https://cdn.tobi.com/product_images/md/1/plum-maddie-asymmetrical-bodycon-dress.jpg',
    'https://imgix.bustle.com/rehost/2016/9/14/461f461b-f90c-4f8d-8c65-7c0e10adc8ac.jpg?w=970&h=546&fit=crop&crop=faces&auto=format&q=70',
    'https://cdn.shopify.com/s/files/1/1301/4561/products/36-1_grande.jpg?v=1494826094',
    'https://lh3.googleusercontent.com/proxy/6_fGFEGl3dfZRnHIqBzUvxKB8M5hiSUH5_P19UUDIfjlvp-bO2gAVqj8oqF4J-w79oeofEX0eTqF4KwDrgOPa7JP8TTpzfK7TgCcqIvTw4Rint-BEbidGFASJOvA27omERAjOkrQjzH8uotky13lneBFVidlRyyQP2nV1atffojYZ60jJOyxi62HM2Y0R5M73EKLFSLTlOxxIxirNCAoVIOZwqbhuo9fdw',
    'https://www.whwatts.co.uk/images/chicco-hoopla-baby-bouncer-ocean-p31636-79697_zoom.jpg',
  ];
  static const String dummyText =
      "- Đế giày làm bằng cao su nhiệt dẻo (TPR). xẻ rãnh chống trơn trượt cho bé vui chơi thỏa thích \n- Cách tính cỡ Giày trẻ em cho bé (Bạn đo chiều dài bàn chân xem kích thước là bao nhiêu)\n- Ướm đi thử vừa là vừa";

  static List<dynamic> categoryDummy = [
    {'icon': 'photo/ic_phone.png', 'title': "Điện thoại & phụ kiện"},
    {'icon': 'photo/ic_toy.png', 'title': "Đồ chơi"},
    {'icon': 'photo/ic_store.png', 'title': "Bách Hóa Online"},
    {'icon': 'photo/ic_bike.png', 'title': "Ô tô - xe máy, xe đạp"},
    {'icon': 'photo/ic_phone.png', 'title': "Điện thoại & phụ kiện"},
    {'icon': 'photo/ic_toy.png', 'title': "Đồ chơi"},
  ];
}

class RouteUtil {
  static Future<dynamic> push(BuildContext context, Widget nextPage) {
    return Navigator.of(context)
        .push(CupertinoPageRoute(builder: (_) => nextPage));
//    _circularSplashController.push(context, nextPage);
  }

  static Future<dynamic> pushReplacement(
      BuildContext context, Widget nextPage) {
    return Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (_) => nextPage));
//    _circularSplashController.pushReplacement(context, nextPage);
  }

  static Future<dynamic> pushAndReplaceAll(
      BuildContext context, Widget nextPage, String routeName) {
    return Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => nextPage),
        ModalRoute.withName(routeName));
  }
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
  static const double midSpace = 12;
  static const double smallSpace = 10;
  static const double midSmallSpace = 8.0;
  static const double tinySpace = 5;
  static const double superTinySpace = 3;
  static const double bigSpace = 30;
  static const double bigSpacehigher = 32;
  static const double hugSpace = 50;
  static const double largeSpace = 70;
  static const double biggerSpace = 40;
  static const double notifyHintSpace = 36;

  static const double textSizeBig = 24;
  static const double textSizeItemPost = 30;
  static const double textSizeBigger = 17;
  static const double textSizeDefault = 15;
  static const double textSizeExpressTitle = 14;
  static const double textSizeExpressDetail = 13;
  static const double textSizeSmall = 11;
  static const double textSizeNotiTime = 10;
  static const double textSizeTiny = 8;
  static const double textSizeMini = 5;
  static const double textSizeHuge = 40;
  static const double textSizeLogo = 22;

  static const double iconSizeLarge = 52;
  static const double iconSize = 16;
  static const double iconMidSize = 18;
  static const double iconSizeDefault = 12;
  static const double iconSizeBigger = 24;
  static const double iconSizeBig = 32;
  static const double iconSizeSmall = 10;
  static const double iconSizeTiny = 8;

  static const double smallRadius = 10;
  static const double bigRadius = 16;
  static const double tinyRadius = 5;

  static const double defaultElevation = 5;
  static const double smallElevation = 3;

  static const double lineHeight = 5;
  static const double delivery_code_height = 36;
}

class WidgetUtil {
  static Widget paddingWidget(Widget widget,
      {EdgeInsets padding = const EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.smallSpace)}) {
    return Padding(
      padding: padding,
      child: widget,
    );
  }

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

  static Widget getLine(
      {EdgeInsetsGeometry margin = const EdgeInsets.only(
          top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
      double width = 1,Color color = ColorUtil.lineColor}) {
    return Container(
      height: width,
      color: color,
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

  static List<BoxShadow> getShadow() {
    return [
      BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: Offset(0, 1),
          blurRadius: 0.7),
      BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: Offset(0, 2),
          blurRadius: 0.8),
    ];
  }
}

setBorder(String side, Color borderColor, double width) {
  var boxDecoration = BoxDecoration();
  var borderSide =
      BorderSide(width: width, style: BorderStyle.solid, color: borderColor);

  if (side == 'bottom') {
    boxDecoration = BoxDecoration(border: Border(bottom: borderSide));
  } else if (side == 'top') {
    boxDecoration = BoxDecoration(border: Border(top: borderSide));
  } else if (side == 'left') {
    boxDecoration = BoxDecoration(border: Border(left: borderSide));
  } else if (side == 'right') {
    boxDecoration = BoxDecoration(border: Border(right: borderSide));
  } else {
    boxDecoration = BoxDecoration(
        border: Border.all(
            color: borderColor, style: BorderStyle.solid, width: width));
  }

  return boxDecoration;
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.color, this.tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}
