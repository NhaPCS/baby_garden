import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseState<S extends StatefulWidget> extends State<S> with AutomaticKeepAliveClientMixin{
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
    super.build(context);
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
      Color bgColor = ColorUtil.primaryColor}) {
    return AppBar(
      elevation: elevation,
      backgroundColor: bgColor,
      title: title != null
          ? Text(
              title,
              style: TextStyle(
                  fontSize: SizeUtil.textSizeBigger, color: Colors.white),
            )
          : null,
      centerTitle: centerTitle,
      leading: InkWell(
        child: Icon(
          CupertinoIcons.back,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
