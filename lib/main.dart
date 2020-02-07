import 'package:baby_garden_flutter/screen/home_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: ColorUtil.primaryColor,
          accentColor: ColorUtil.textColor,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: ColorUtil.textColor),
            display1: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            display3: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            display2: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            display4: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            headline: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            body2: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
            body1: TextStyle(
                color: ColorUtil.textColor, fontSize: SizeUtil.textSizeDefault),
          )),
      home: HomeScreen(),
    );
  }
}
