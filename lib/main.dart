import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/city_provider.dart';
import 'package:baby_garden_flutter/provider/get_banners_provider.dart';
import 'package:baby_garden_flutter/provider/get_product_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_service_category_provider.dart';
import 'package:baby_garden_flutter/provider/receive_address_list_provider.dart';
import 'package:baby_garden_flutter/provider/notify_control_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/partner_like/partner_like_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MultiProvider(
        providers: [
          //TODO-hung: check lai dong nay
          Provider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => GetProductCategoryProvider()),
          ChangeNotifierProvider(create: (_) => GetServiceCategoryProvider()),
          ChangeNotifierProvider(create: (_) => GetBannersProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CityProvider()),
          ChangeNotifierProvider(create: (_) => ReceiveAddressListProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => NotifyProvider()),
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
    // get product categories
    if (Provider.of<GetProductCategoryProvider>(context).categories == null ||
        Provider.of<GetProductCategoryProvider>(context).categories.isEmpty)
      Provider.of<GetProductCategoryProvider>(context).getProductCategories();

    // get service categories
    if (Provider.of<GetServiceCategoryProvider>(context).categories == null ||
        Provider.of<GetServiceCategoryProvider>(context).categories.isEmpty)
      Provider.of<GetServiceCategoryProvider>(context).getServiceCategories();

    // get banners
    if (Provider.of<GetBannersProvider>(context).banners == null ||
        Provider.of<GetBannersProvider>(context).banners.isEmpty) {
      Provider.of<GetBannersProvider>(context).getBanners();
    }

    //get user info
    if (!Provider.of<UserProvider>(context).isRun)
      Provider.of<UserProvider>(context).getUserInfo();

    //get user info
    if (Provider.of<CityProvider>(context).cities == null ||
        Provider.of<CityProvider>(context).cities.isEmpty)
      Provider.of<CityProvider>(context, listen: false).getCities();

    //get my cart
    if (!Provider.of<CartProvider>(context).isRun)
      Provider.of<CartProvider>(context).getMyCart();

    //todo get notify
    if (Provider.of<NotifyProvider>(context).promotions == null)
      Provider.of<NotifyProvider>(context).getNotify();
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
