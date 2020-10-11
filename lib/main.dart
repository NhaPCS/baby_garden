import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/city_provider.dart';
import 'package:baby_garden_flutter/provider/get_balloon_provider.dart';
import 'package:baby_garden_flutter/provider/get_banners_provider.dart';
import 'package:baby_garden_flutter/provider/get_main_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_product_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_service_category_provider.dart';
import 'package:baby_garden_flutter/provider/list_introduct_provider.dart';
import 'package:baby_garden_flutter/provider/orders_provider.dart';
import 'package:baby_garden_flutter/provider/privacy_provider.dart';
import 'package:baby_garden_flutter/provider/receive_address_list_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/customer_support_detail/provider/get_support_provider.dart';
import 'package:baby_garden_flutter/screen/notify/provider/notify_control_provider.dart';
import 'package:baby_garden_flutter/screen/welcome/welcome_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MultiProvider(
        providers: [
          Provider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => GetProductCategoryProvider()),
          ChangeNotifierProvider(create: (_) => GetServiceCategoryProvider()),
          ChangeNotifierProvider(create: (_) => GetBannersProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CityProvider()),
          ChangeNotifierProvider(create: (_) => ReceiveAddressListProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => NotifyProvider()),
          ChangeNotifierProvider(create: (_) => OrdersProvider()),
          ChangeNotifierProvider(create: (_) => GetMainCategoryProvider()),
          ChangeNotifierProvider(create: (_) => PrivacyProvider()),
          ChangeNotifierProvider(create: (_) => ListIntroductionProvider()),
          ChangeNotifierProvider(create: (_) => GetBalloonProvider()),
          ChangeNotifierProvider(create: (_) => GetSupportProvider()),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (Provider.of<PrivacyProvider>(context).privacy == null)
      Provider.of<PrivacyProvider>(context).getPrivacy();

    if (Provider.of<GetSupportProvider>(context).data == null ||
        Provider.of<GetSupportProvider>(context).data.keys.isEmpty)
      Provider.of<GetSupportProvider>(context).getSupport();

    // get product categories
    if (Provider.of<GetProductCategoryProvider>(context).categories == null ||
        Provider.of<GetProductCategoryProvider>(context).categories.isEmpty)
      Provider.of<GetProductCategoryProvider>(context).getProductCategories();

    if (Provider.of<GetMainCategoryProvider>(context).categories == null ||
        Provider.of<GetMainCategoryProvider>(context).categories.isEmpty)
      Provider.of<GetMainCategoryProvider>(context).getMainCategories();

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
    if (Provider.of<UserProvider>(context).isLogin &&
        Provider.of<NotifyProvider>(context).promotions == null)
      Provider.of<NotifyProvider>(context).getNotify();

    if (Provider.of<OrdersProvider>(context).SERVICE_OPTIONS.isEmpty)
      Provider.of<OrdersProvider>(context).init();

    if (Provider.of<GetBalloonProvider>(context).balloon == null)
      Provider.of<GetBalloonProvider>(context).getBalloon();
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
      home: WelcomeScreen(),
    );
  }
}
