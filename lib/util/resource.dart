import 'dart:io';
import 'dart:ui';

import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class ColorUtil {
  static const Color primaryColor = Color(0xffFF8918);
  static const Color colorAccent = Color(0xffFFB00B);
  static const Color textColor = Color(0xff40433F);
  static const Color textGray = Color(0xff808080);
  static const Color textHint = Color(0xff646464);
  static const Color black33 = Color(0xff333333);
  static const Color green = Color(0xff13BE2A);
  static const Color greenDarker = Color(0xff13A208);
  static const Color red = Color(0xffFF0000);
  static const Color blue = Color(0xff49aefc);
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
  static const Color whiteIcon = Color(0xffF6F6F6);
  static const Color logoBgColor = Color(0xffE1F2F9);
  static const Color transGray = Color(0x66EFEFEF);
  static const Color grayLine = Color(0xff646464);
  static const Color customerSupportUpdate = Color(0xff73EBD5);
  static const Color darkGray = Color(0xff707070);
  static const serviceItemUnselectColor = Color(0xffF6F6F6);
  static const Color textDark = Color(0xff444444);
  static const Color grayEC = Color(0xffececec);
  static const Color trackingTargetColor = Color(0xff6C6C6C);
  static const Color unSelectBgColor = Color(0xffF2F2F2);
  static const Color lineLightGray = Color(0xffCECECE);
  static const Color lineService = Color(0xffDFDFDF);
  static const Color bgService = Color(0xffFFEDDB);
  static const Color orderBadge = Color(0xffFF5700);

  static const List<Color> gradientColors = [
    Color(0xffFFA503),
    Color(0xffFF9D0D),
    Color(0xffFF872A),
    Color(0xffD89012)
  ];

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}

class DateUtil {
  static final String serverFormatDate = "yyyy-MM-dd HH:mm:ss";

  static String formatBirthdayDate(DateTime date) {
    return date == null ? '' : new DateFormat("dd/MM/yyyy").format(date);
  }

  static String formatNormalDate(DateTime date) {
    return date == null ? '' : new DateFormat("dd/MM/yyyy").format(date);
  }

  static String formatNormalDateTime(DateTime date) {
    return date == null ? '' : new DateFormat("dd/MM/yyyy HH:mm").format(date);
  }

  static String formatTime(DateTime date) {
    return date == null ? '' : new DateFormat("HH:mm").format(date);
  }

  static DateTime parseBirthdayDate(String date) {
    return date == null || date.isEmpty
        ? null
        : new DateFormat("dd/MM/yyyy").parse(date);
  }

  static String formatDDMMyyyy(String rawDate) {
    DateTime date = new DateFormat(serverFormatDate).parse(rawDate);
    return new DateFormat("dd/MM/yyyy").format(date);
  }

  /*
 static const int monday = 2;
      static const int tuesday = 3;
      static const int wednesday = 4;
      static const int thursday = 5;
      static const int friday = 6;
      static const int saturday = 7;
      static const int sunday = 1;
      static const int daysPerWeek = 7;
  */
  static List<dynamic> getDate() {
    List<dynamic> dates = List();
    final dowFormat = new DateFormat("EEEE", "vi");
    final dateFormat = new DateFormat("dd/MM/yyyy");
    var now = new DateTime.now();
    for (int i = 0; i <= 6; i++) {
      final date = now.add(new Duration(days: i));
      dates.add({
        'index': date.weekday == 7 ? 1 : date.weekday + 1,
        'dow': dowFormat.format(date),
        'date': dateFormat.format(date)
      });
    }
    print("getDate $dates");
    return dates;
  }
}

class ImageUtil {
  static void uploadImage(
      BuildContext context, ValueChanged<File> onSelectImage) {
    if (onSelectImage == null) return;
    WidgetUtil.showPickImageDialog(context, onCameraClick: () async {
      var pickedImage = await ImagePicker.pickImage(source: ImageSource.camera);
      onSelectImage(pickedImage);
    }, onGalleryClick: () async {
      var pickedImage =
          await ImagePicker.pickImage(source: ImageSource.gallery);
      onSelectImage(pickedImage);
    });
  }
}

class StringUtil {
  /*"active:
  1: đã đặt,
  2: xác nhận,
  3: hoàn thành,
  4: huỷ,
  5:đang đóng gói,
  6: đang vận chuyển"*/
  static String getVoucherStatus(BuildContext context, String active) {
    if (active == null) return "";
    switch (active) {
      case "1":
        return S.of(context).voucher_not_get;
      case "2":
        return S.of(context).voucher_got;
      case "3":
        return S.of(context).voucher_used;
    }
    return "";
  }

  static String getPriceText(String price) {
    if (price == null || price.isEmpty) return "";
    try {
      return new NumberFormat.currency(
              locale: "vi_VN", name: "", decimalDigits: 0, symbol: "đ")
          .format(int.parse(price));
    } on Exception catch (e) {
      return "";
    }
  }

  static double getSalesPercent(String numberSales, String total) {
    if (numberSales == null || total == null) return 0;
    return int.parse(numberSales) / int.parse(total);
  }

  static int getDiscountPercent(dynamic product) {
    if (product == null ||
        product['price'] == null ||
        product['price_discount'] == null) return 0;
    try {
      double dP = double.parse(product['price_discount']);
      double p = double.parse(product['price']);
      int result = (((p - dP) / p) * 100).toInt();
      return result;
    } on Exception catch (e) {
      print(e);
      return 0;
    }
  }

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

  static List<dynamic> confirmForm = [
    {
      'title': 'Dịch vụ đã đặt: ',
      'content': 'Chăm sóc da mặt từ cơ bản đến nâng cao'
    },
    {
      'title': 'Giá niêm yết:  ',
      'content':
          '\nKhách hàng đã có thẻ hoặc mã voucher vui lòng mang tới cửa hàng để được hưởng đầy đủ ưu đãi.',
      'value': '150.000 đ'
    },
    {'title': 'Ngày sử dụng: ', 'content': '14/02/2020'},
    {'title': 'Thời gian: ', 'content': '10:00'},
    {'title': 'Thời gian thực hiện: ', 'content': '120 Phút'},
  ];

  static List<dynamic> time = [
    {'time': '08:00'},
    {'time': '08:15'},
    {'time': '08:30', 'off': '0'},
    {'time': '08:45'},
    {'time': '09:00'},
    {'time': '09:15'},
    {'time': '09:30'},
    {'time': '09:45'},
    {'time': '10:00'},
    {'time': '10:15'},
    {'time': '10:30'},
    {'time': '10:45'},
    {'time': '11:00'},
    {'time': '11:15'},
    {'time': '11:30', 'off': '0'},
    {'time': '11:45'},
    {'time': '12:00'},
    {'time': '12:15'},
    {'time': '12:30'},
    {'time': '12:45'},
    {'time': '13:00'},
    {'time': '13:15'},
    {'time': '13:30'},
    {'time': '13:45'},
    {'time': '14:00'},
    {'time': '14:15'},
    {'time': '14:30'},
    {'time': '14:45'},
    {'time': '15:00'},
    {'time': '15:15'},
    {'time': '15:30'},
    {'time': '15:45'},
    {'time': '16:00'},
    {'time': '16:15'},
    {'time': '16:30'},
    {'time': '16:45'},
    {'time': '17:00'},
    {'time': '17:15'},
    {'time': '17:30'},
    {'time': '17:45'},
    {'time': '18:00'},
    {'time': '18:15'},
    {'time': '18:30'},
    {'time': '18:45'},
    {'time': '19:00'},
    {'time': '19:15'},
    {'time': '19:30'},
    {'time': '19:45'},
    {'time': '20:00'},
    {'time': '20:15'},
    {'time': '20:30'},
    {'time': '20:45'},
    {'time': '21:00'},
    {'time': '21:15'},
    {'time': '21:30'},
    {'time': '21:45'},
  ];

  static List<String> banks1 = [
    'VietcomBank',
    'TechcomBank',
    'BIDV',
    'ViettinBank',
    'MBBank'
  ];

  static List<dynamic> banks = [
    {
      'bank': 'VietcomBank',
      'accountNumber': '00112233445566',
      'accountOwner': 'Vũ Thị Hài'
    },
    {
      'bank': 'TechcomBank',
      'accountNumber': '00880900989089',
      'accountOwner': 'Vũ Thị Hài'
    },
    {
      'bank': 'BIDV',
      'accountNumber': '00880900989089',
      'accountOwner': 'Vũ Thị Hài'
    },
    {
      'bank': 'ViettinBank',
      'accountNumber': '10923809821989',
      'accountOwner': 'Vũ Thị Hài'
    },
    {
      'bank': 'MBBank',
      'accountNumber': '00112233445566',
      'accountOwner': 'Vũ Thị Hài'
    },
  ];

  static List<DropdownMenuItem<dynamic>> bankAccounts = [
    new DropdownMenuItem(child: Text('VietcomBank'), value: banks1[0]),
    new DropdownMenuItem(child: Text('TechcomBank'), value: banks1[1]),
    new DropdownMenuItem(child: Text('BIDV'), value: banks1[2]),
    new DropdownMenuItem(child: Text('ViettinBank'), value: banks1[3]),
    new DropdownMenuItem(child: Text('MBBank'), value: banks1[4]),
  ];

  static List<dynamic> week = [
    {'dow': 'Thứ 2', 'date': '12/02/2020'},
    {'dow': 'Thứ 3', 'date': '13/02/2020'},
    {'dow': 'Thứ 4', 'date': '14/02/2020'},
    {'dow': 'Thứ 5', 'date': '15/02/2020'},
    {'dow': 'Thứ 6', 'date': '16/02/2020'},
    {'dow': 'Thứ 7', 'date': '17/02/2020'},
    {'dow': 'Chủ nhật', 'date': '18/02/2020'},
  ];

  static List<dynamic> clientList = [
    {'address': '38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội'},
    {'address': '15B Đào Tấn, Ba Đình, Hà Nội'},
    {'address': '134 Lê Lợi, Hà Đông, Hà Nội'},
    {'address': '134 Lê Lợi, Hà Đông, Hà Nội'}
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
  static const EdgeInsets miniPadding = EdgeInsets.all(3);
  static const EdgeInsets normalPadding = EdgeInsets.all(15);

  static const double defaultSpace = 20;
  static const double normalSpace = 15;
  static const double midSpace = 12;
  static const double smallSpace = 10;
  static const double midSmallSpace = 8.0;
  static const double tinySpace = 4;
  static const double superTinySpace = 2;
  static const double zeroSpace = 0;
  static const double bigSpace = 30;
  static const double bigSpaceHigher = 32;
  static const double hugSpace = 50;
  static const double largeSpace = 70;
  static const double biggerSpace = 40;
  static const double notifyHintSpace = 36;
  static const double normalBigSpace = 25;

  static const double textSizeBig = 24;
  static const double textSizeItemPost = 30;
  static const double textSizeBigger = 17;
  static const double textSizeDefault = 15;
  static const double textSizeExpressTitle = 14;
  static const double textSizeExpressDetail = 13;
  static const double textSizeSmall = 11;
  static const double textSizeNoticeTime = 10;
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

  static const double tab_bar_fix_height = 40;

  static const double textSpaceTiny = 1;
  static const double textSpaceSmall = 2;
  static const double textSpaceNormal = 3;
  static const double textSpaceBig = 4;
}

class FileUtil {
  static Future<File> compressFile(File file) async {
    try {
      if (file.lengthSync() > 1024 * 1024 &&
          (file.path.endsWith("jpg") || file.path.endsWith("jpeg"))) /*1MB*/ {
        Directory tempFolder = await getTemporaryDirectory();
        File compressedFile = await FlutterImageCompress.compressAndGetFile(
            file.path,
            "${tempFolder.path}/${DateTime.now().toIso8601String()}.jpg",
            quality: 60);
        if (compressedFile != null) {
          print(
              "compressed file ${compressedFile.path}  ${compressedFile.lengthSync()}");
          return compressedFile;
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    return file;
  }
}
enum SettingNotify{ NONE, PRODUCT, LIKE_PRODUCT_CHANGE, SERVICE, VCB_EXPRESS }

enum BookingType { NONE, BOOKING_PRODUCT, BOOKING_SERVICE }

enum TransportState {
  NONE,
  WAITING_CONFIRM,
  OTHER,
  SUCCESS,
  CANCEL,
  PACKING,
  IN_DELIVERY,
  RECEIVE_IN_SHOP,
  WAITING_CHECKOUT
}

enum CheckoutStatus{
  NONE,
  UN_PAY,
  ALREADY_PAY,
}

enum CheckoutMethod{
  NONE,
  CAST,
  CREDIT_TRANSFER
}

enum DeliveryMethodState{
  DELIVERY,
  RECEIVE_IN_SHOP,
  NONE,
}

enum BookingState {
  NONE,
  WAITING_CONFIRM,
  CONFIRM,
  SUCCESS,
  CANCEL,
  PACKING,
  IN_DELIVERY,
  RECEIVE_IN_SHOP,
  WAITING_CHECKOUT
}

enum ServiceState { NONE, BOOKED_SCHEDULE, CONFIRM, USED_SERVICE, CANCEL }

enum TransferStatus {
  NONE,
  WAITING_GET_PRODUCT,
  GETTING_PRODUCT,
  IN_STORAGE,
  IN_DELIVERY
}

class WidgetUtil {
  static void showGenderSelectorDialog(
      BuildContext context, ValueChanged<int> selectedGender,
      {int initGender}) {
    new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: [
          S.of(context).boy,
          S.of(context).girl,
        ]),
        changeToFirst: true,
        hideHeader: false,
        selecteds: initGender == null ? null : [initGender-1],
        onConfirm: (Picker picker, List value) {
          selectedGender(value[0] + 1);
        }).showModal(context); //_scaffoldKey.currentState);
  }

  static Future<void> showBirthdaySelectorDialog(
      BuildContext context, ValueChanged<DateTime> selectedDate,
      {DateTime initDate}) async {
    showDatePicker(
            context: context,
            initialDate: initDate == null ? DateTime.now() : initDate,
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101))
        .then((value) => {selectedDate(value)});
  }

  static void showPickImageDialog(BuildContext context,
      {VoidCallback onCameraClick, VoidCallback onGalleryClick}) {
    showConfirmDialog(context,
        title: S.of(context).title_select_pick_image,
        message: S.of(context).message_select_pick_image,
        positive: S.of(context).from_camera,
        negative: S.of(context).from_gallery,
        positiveClicked: onCameraClick,
        negativeClick: onGalleryClick);
  }

  static void showRequireLoginDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Text(S.of(context).message_require_login),
          title: Text(S.of(context).title_require_login),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).cancel)),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  RouteUtil.push(context, LoginScreen());
                },
                child: Text(S.of(context).login))
          ],
        ));
  }

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
        barrierDismissible: true,
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
      double width = 1,
      Color color = ColorUtil.lineColor}) {
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
      String negative = "Cancel",
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

  static verifyParams(BuildContext context,
      {List<Param> params, bool showErrorDialog = true}) {
    for (Param p in params) {
      print(p.checkType);
      switch (p.checkType) {
        case CheckType.NULL_OR_EMPTY_VALUE: // null and empty value
          print(p.value.runtimeType);
          if (p.value == null ||
              (p.value.runtimeType == String && p.value.isEmpty)) {
            if (showErrorDialog)
              WidgetUtil.showErrorDialog(
                  context, S.of(context).message_empty(p.key));
            return false;
          }
          break;
        case CheckType.COMPARE_VALUE: //compare value
          if (p.value != p.valueConpare) {
            if (showErrorDialog) WidgetUtil.showErrorDialog(context, p.key);
            return false;
          }
          break;
        case CheckType.EMAIL_FORMAT: //  email format
          if (p.value == null ||
              p.value.isEmpty ||
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(p.value)) {
            if (showErrorDialog) WidgetUtil.showErrorDialog(context, p.key);
            return false;
          }
          break;
        case CheckType.PHONE_FORMAT:
          print(p.value);
          if (p.value == null ||
              p.value.isEmpty ||
              !RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(p.value)) {
            if (showErrorDialog) WidgetUtil.showErrorDialog(context, p.key);
            return false;
          }
          break;
        default:
          return false;
      }
    }
    print(" herererer");
    return true;
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
