import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseState<S extends StatefulWidget> extends State<S> {
  Widget buildWidget(BuildContext context);

  List<SingleChildWidget> providers();

//  CircularTransitionController _circularSplashController;

  @override
  void initState() {
    super.initState();
//    _circularSplashController = CircularTransitionController(
//      color: ColorUtil.primaryColor,
//      duration: Duration(milliseconds: 300),
//    );
  }

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> prs = providers();
    return prs == null || prs.isEmpty
        ? GestureDetector(
            child: buildWidget(context),
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          )
        : MultiProvider(
            providers: prs,
            child: GestureDetector(
              child: buildWidget(context),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
            ));
  }

  void push(Widget nextPage) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (_) => nextPage));
//    _circularSplashController.push(context, nextPage);
  }

  void pushReplacement(Widget nextPage) {
    Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (_) => nextPage));
//    _circularSplashController.pushReplacement(context, nextPage);
  }

  void pushAndReplaceAll(Widget nextPage, String routeName) {
    service.pushAndReplaceAll(context, nextPage, routeName);
  }

  AppBar getAppBar(
      {String title,
      bool centerTitle = true,
      double elevation = 0,
      Color bgColor = Colors.white}) {
    return AppBar(
      elevation: elevation,
      backgroundColor: bgColor,
      title: title != null
          ? Text(
              title,
              style: TextStyle(fontSize: SizeUtil.textSizeBigger),
            )
          : null,
      centerTitle: centerTitle,
      leading: InkWell(
        child: Icon(
          CupertinoIcons.back,
          color: ColorUtil.black26,
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
