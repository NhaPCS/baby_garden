import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/login/login_screen.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() => runApp(Provider(
      create: (_) => AppProvider(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: LoginScreen(),
    );
  }
}
