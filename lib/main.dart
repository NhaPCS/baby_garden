import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/get_product_category_provider.dart';
import 'package:baby_garden_flutter/screen/booking/booking_screen.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/order/order_delivery_info_screen.dart';
import 'package:baby_garden_flutter/screen/order/order_detail_screen.dart';
import 'package:baby_garden_flutter/screen/partner/partner_book_schedule.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/screen/vcb_express/vcb_express_screen.dart';
import 'package:baby_garden_flutter/screen/welcome/welcome_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'generated/l10n.dart';
import 'screen/remind_management/remind_edit_screen.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MultiProvider(
        providers: [
          Provider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => GetProductCategoryProvider())
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Provider.of<GetProductCategoryProvider>(context).categories == null ||
        Provider.of<GetProductCategoryProvider>(context).categories.isEmpty)
      Provider.of<GetProductCategoryProvider>(context).getProductCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby garden',
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
          primaryColor: ColorUtil.primaryColor,
          accentColor: ColorUtil.colorAccent,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: ColorUtil.textColor),
              focusColor: ColorUtil.primaryColor,
              hintStyle: TextStyle(color: ColorUtil.textHint),
              fillColor: Colors.white),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: ColorUtil.textColor),
            headline4: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            headline2: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            headline3: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            headline1: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            headline5: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            bodyText2: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            bodyText1: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
          )),
      home: MainScreen(),
    );
  }
}
